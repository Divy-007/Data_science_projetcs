from database.connection import get_connection
from utils.id_generator import generate_question_id

# Insert scraped interview questions into PostgreSQL.
# Deduplication is handled by question_id + ON CONFLICT.
def insert_questions(records):
    

    conn = get_connection()
    cursor = conn.cursor()
# query for inserting into public.interview_question table
    query = """
    INSERT INTO public.interview_question
    (question_id, questions, answers, topics, difficulty_level)
    VALUES (%s, %s, %s, %s, %s)
    ON CONFLICT (question_id) DO NOTHING;
    """
# iterate through each record and insert into the database
    for row in records:
        # skip if question text is missing
        if not row.get("questions"):
            continue
# extract question text and generate question ID
        q_text = row["questions"]
        q_id = generate_question_id(q_text)
# execute the insert query with the record data
        cursor.execute(
            query,
            (
                q_id,
                q_text,
                row.get("answers"),
                row.get("topics"),
                row.get("difficulty_level"),
            )
        )
# commit the transaction and close the connection
    conn.commit()
    cursor.close()
    conn.close()
