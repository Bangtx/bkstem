from typing import List, Optional
from datetime import date

from .schema import Schema

class Breakdown(Schema):
    item_id: Optional[int]
    variety_id: Optional[int]
    size_id: Optional[int]
    quality_id: Optional[int]
    color_id: Optional[int]
    quantity: Optional[int]


class AssignmentBase(Schema):
    auction_date: date
    packing_result_id: int = None
    order_detail_id: int = None
    boxes: int
    stems: int
    price: int = None
    quantity: int
    remark: str = None
    buyer_info: str = None
    breakdowns: Optional[List[Breakdown]]
    amount: int = None


class AssignmentCreate(AssignmentBase):
    id: Optional[int]
    item_id: int
    variety_id: int
    size_id: int
    quality_id: int
    unit_id: int
    customer_id: int
    box_type_id: int
    order_type_id: int
    color_ids: List[int] = []


class CustomerInfo(Schema):
    customer_id: int
    boxes: int

class AssignmentCreateMultipleCustomer(AssignmentBase):
    item_id: int
    variety_id: int
    size_id: int
    quality_id: int
    unit_id: int
    customers_info: List[CustomerInfo]
    box_type_id: int
    order_type_id: int
    color_ids: List[int] = []


class AssignmentUpdate(AssignmentCreate):
    pass


class Master(Schema):
    id: int
    name: str


class Color(Master):
    code: str


class Customer(Master):
    code: str = None


class Assignment(AssignmentBase):
    id: int
    item: Master
    variety: Master
    size: Master
    unit: Master
    quality: Master
    order_type: Master
    box_type: Master
    colors: List[Color] = []
    color_ids: List[int] = []
    customer: Customer


class AssignmentList(Schema):
    assignments: List[AssignmentCreate]


class AssignmentBatchCreate(AssignmentCreate):
    boxes: int = None
    stems: int = None
    customer_id: int = None


class BatchAssign(Schema):
    order_detail_ids: List[int]
    assignment: AssignmentBatchCreate


class AutoAssign(Schema):
    order_type_ids: List[int] = None
    order_detail_ids: List[int] = None
    auction_date: date
    start_date: date
    end_date: date
