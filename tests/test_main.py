from fastapi.testclient import TestClient
from main import app

client = TestClient(app)

def test_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message": "Wiki API"}

def test_search():
    response = client.get("/search/albert einstein")
    assert response.status_code == 200
    assert "Albert Einstein" in response.json()['result']

def test_page():
    response = client.get("/wiki/albert einstein")
    assert response.status_code == 200
    assert "physicist" in response.json()['result']

def test_phrase():
    response = client.get("/phrase/albert einstein")
    assert response.status_code == 200
    assert "eyen-styne" in response.json()['result']
