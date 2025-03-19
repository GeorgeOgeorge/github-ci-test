from fastapi.testclient import TestClient

from app.server import app


class TestRoute:
    def test_read_root(self):
        client = TestClient(app)
        response = client.get("/")

        assert response.status_code == 200
        assert response.json() == {'Hello': 'World'}
