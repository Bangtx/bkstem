from .schema import Schema
import uuid


class File(Schema):
    name: str
    payload: str
    type: str
    size: int
    uuid: uuid.UUID


class Image(Schema):
    id: int
    name: str
    uuid: uuid.UUID
    url: str
