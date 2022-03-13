from datetime import date
from typing import Optional

from .schema import Schema


class NoSaleDate(Schema):
    active: Optional[bool]
    created_at: Optional[date]
    created_by: Optional[int]
    date_from: Optional[date]
    date_to: Optional[date]
    deleted_at: Optional[date]
    deleted_by: Optional[int]
    id: Optional[int]
    is_annual: Optional[bool]
    modified_at: Optional[date]
    modified_by: Optional[int]
    note: Optional[str]


class NoSaleDateCreatePayLoad(Schema):
    date_from: date
    date_to: date
    note: str
    is_annual: bool
