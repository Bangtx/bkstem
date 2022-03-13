from .schema import Schema


class Member(Schema):
    id: int
    email: str
    setting: dict
