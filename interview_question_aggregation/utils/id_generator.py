import hashlib
# Utility function to generate a unique ID for a question based on its text
def generate_question_id(question_text):
    normalized = " ".join(question_text.lower().strip().split())
    return hashlib.sha256(normalized.encode("utf-8")).hexdigest()