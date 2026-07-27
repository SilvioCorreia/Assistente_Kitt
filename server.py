import os
from dotenv import load_dotenv
from fastapi import FastAPI
from livekit import api

load_dotenv()

app = FastAPI()

@app.post("/api/token")
async def generate_token(room_name: str, participant_identity: str):
    token = (
        api.AccessToken(
            os.getenv("LIVEKIT_API_KEY"),
            os.getenv("LIVEKIT_API_SECRET")
        )
        .with_identity(participant_identity)
        .with_grants(api.VideoGrants(room_join=True, room=room_name))
    )
    return {"token": token.to_jwt()}