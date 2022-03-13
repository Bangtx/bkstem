from datetime import date
from typing import List

from .schema import Schema
from typing import Optional

# from .size import Size
from .size_group import SizeGroup


class OrderDetailBase(Schema):
    quantity: int = None
    boxes: int = None
    stems: int
    remark: str = None
    price: int = None
    amount: int = None
    buyer_info: str = None
    is_special: bool = None


class OrderDetailAndOrder(OrderDetailBase):
    detail_id: int = None
    item_id: int
    variety_id: int = None
    size_id: int = None
    color_ids: List[int] = []
    quality_id: int = None
    unit_id: int = None
    order_type_id: int = None
    customer_id: int
    auction_date: str


class OrderDetailAndOrderGet(Schema):
    order_detail: int = None
    order: int = None


class OrderDetailParam(OrderDetailBase):
    item_id: int
    variety_id: int = None
    size_id: int = None
    color_ids: List[int] = []
    quality_id: int = None
    unit_id: int = None
    order_type_id: int = None
    order_id: int


class OrderDetailCreate(OrderDetailParam):
    harvest_result_ids: List[int] = []


class OrderDetailUpdate(OrderDetailParam):
    pass


class OrderDetailLock(Schema):
    is_lock: bool


class OrderDetailAssigned(Schema):
    ids: List[int]


class OrderDetailByHarvest(Schema):
    harvest_result_ids: List[int]


class Master(Schema):
    id: int = None
    name: str = None


class Color(Master):
    code: str


class Customer(Schema):
    id: int
    name: str
    code: str = None


class Order(Schema):
    id: int
    customer: Customer
    auction_date: date


class Item(Master):
    search_str: Optional[str] = None
    size_group: Optional[SizeGroup] = None


class Variety(Master):
    search_str: Optional[str] = None
    size_group: Optional[SizeGroup] = None


class Size(Master):
    search_str: Optional[str] = None
    size_group: Optional[SizeGroup] = None


class OrderDetail(OrderDetailBase):
    id: int
    item: Item
    variety: Variety = None
    size: Size = None
    colors: List[Color] = []
    color_ids: List[int]
    quality: Master = None
    unit: Master
    order_type: Master = None
    is_lock: bool
    is_assigned: bool
    order: Order
    assign_stems: int = None
    assign_boxes: int = None


class DetailByHarvest(Schema):
    id: int
    stems: int
    customer_id: int
    customer_name: str
    customer_code: str
    auction_date: date
    assign_stems: int
