from datetime import date

from .schema import Schema
from .order import Customer


class Master(Schema):
    id: int
    name: str


class Record(Schema):
    type: int
    date: date
    item: Master = None
    variety: Master = None
    size: Master = None
    unit: Master = None
    quality: Master = None
    customer: Customer = None
    stems: int
