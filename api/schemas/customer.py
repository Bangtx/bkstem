from .schema import Schema
from datetime import date
from typing import Optional


class CustomerBase(Schema):
    name: str
    yomi: Optional[str] = None
    short_name: Optional[str] = None
    code: Optional[str] = None
    tel: str = None
    fax: Optional[str] = None
    email: Optional[str] = None
    zip_code: str = None
    address_1: str = None
    address_2: str = None
    default_invoice_method: str = None
    allow_pre_sale: bool = True
    level_customer: str = 'market'


class CustomerCreate(CustomerBase):
    pass


class CustomerUpdate(CustomerBase):
    pass


class CustomerSort(Schema):
    id: int
    order_num: Optional[int]


class Customer(CustomerBase):
    id: int
    order_num: Optional[int]
    search_str: str = None
    active: bool = True
    created_at: date
    created_by: int = None
