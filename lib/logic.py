import wikipedia


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
