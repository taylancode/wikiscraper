import wikipedia
from textblob import TextBlob


def wiki(name: str = "War Goddess", length: int = 1) -> str:
    """
    This is a wikipedia fetcher
    """

    my_wiki = wikipedia.summary(name, length)
    return my_wiki


def wiki_search(name: str) -> str:
    """
    Search wikipedia for names
    """

    return wikipedia.search(name)


def wiki_phrase(name: str) -> str:
    """
    Search wikipedia and gets phrase
    """

    page = wiki(name)
    blob = TextBlob(page)

    return blob.noun_phrases
