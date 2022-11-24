import uvicorn
from fastapi import FastAPI
from lib.logic import wiki, wiki_search, wiki_phrase


app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Wiki API"}


@app.get("/search/{name}")
async def search(name: str) -> str:
    return {"result": wiki_search(name)}


@app.get("/wiki/{name}")
async def page(name: str) -> str:
    return {"result": wiki(name)}


@app.get("/phrase/{name}")
async def phrase(name: str) -> str:
    return {"result": wiki_phrase(name)}


if __name__ == "__main__":
    uvicorn.run(app, port=8080, host="0.0.0.0")
