from .schema import Schema
from datetime import date
from typing import List, Optional


class OrderBase(Schema):
    auction_date: date


class OrderCreate(OrderBase):
    customer_id: int


class OrderUpdate(OrderBase):
    customer_id: int


class Customer(Schema):
    id: int
    name: str
    code: str = None
    search_str: str = None


class Order(OrderBase):
    id: int
    pic: int = None
    total_boxes: Optional[int] = None
    total_amount: Optional[int] = None
    assign_amount: Optional[int] = None
    customer: Customer
    created_at: date
    active: bool


class FullOrder(Order):
    order_details: List


class OrderGroupByDate(Schema):
    auction_date: date
    total_boxes: int
    total_stems: int
    assign_boxes: int
    assign_stems: int


class OrderGroupByCustomer(Schema):
    customer: Customer
    total_boxes: int
    total_stems: int
    assign_boxes: int
    assign_stems: int
    ids: List[int]
