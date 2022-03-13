from .schema import Schema
from datetime import date
from typing import Optional, Union, List


class PackingResultBase(Schema):
    packed_date: Union[date, str, None] = None
    quantity: Optional[float]
    boxes: Optional[float]
    total_stems: Optional[float]


class Breakdown(Schema):
    item_id: Optional[int]
    variety_id: Optional[int]
    size_id: Optional[int]
    quality_id: Optional[int]
    color_id: Optional[int]
    quantity: Optional[int]


class PackingResultCreate(PackingResultBase):
    item_id: int
    size_id: int
    color_id: int = None
    quality_id: int
    box_type_id: int
    unit_id: int
    variety_id: int
    total_stems: float
    desired_price: float = None
    ordered_boxes: float
    ordered_stems: float
    assigned_boxes: float
    assigned_stems: float
    breakdowns: Optional[List[Breakdown]]
    remark: str = None


class PackingResultUpdate(PackingResultBase):
    item_id: int
    size_id: int
    color_id: int = None
    quality_id: int
    box_type_id: int
    unit_id: int
    variety_id: int
    total_stems: float
    desired_price: float = None
    ordered_boxes: float
    ordered_stems: float
    assigned_boxes: float
    assigned_stems: float
    breakdowns: Optional[List[Breakdown]]
    remark: str = None


class PackingResultPackedDate(Schema):
    packed_date: Union[date, str, None] = None


class PackingResultSummary(Schema):
    boxes: Optional[int]
    assign_boxes: Optional[int]
    total_stems: Optional[int]
    assign_stems: Optional[int]
    packed_date: Union[date, str, None]


class PackingResultDetail(Schema):
    id: Optional[int]
    boxes: Optional[int]
    total_stems: Optional[float]
    auction_date: Union[date, str, None]


class Master(Schema):
    id: int
    name: str


class Item(Master):
    size_group: Master
    quality_group: Master

class Variety(Master):
    size_group: Master
    quality_group: Master


class ColorMaster(Schema):
    id: int
    code: str
    name: str


class QualityMaster(Schema):
    id: int
    short_name: str = None
    name: str


class Assignment(Schema):
    id: int
    auction_date: str
    order_type: Master
    customer: Master
    buyer_info: str = None
    boxes: float
    stems: float
    price: float = None
    amount: float = None


class PackingResult(PackingResultBase):
    id: Optional[int]
    desired_price: float = None
    ordered_boxes: float = None
    ordered_stems: float = None
    assigned_boxes: float = None
    assigned_stems: float = None
    quality: QualityMaster
    variety: Variety
    item: Item
    size: Master
    unit: Master
    color: ColorMaster = None
    box_type: Master
    search_str: str = None
    active: Optional[bool]
    created_at: Optional[date]
    created_by: Optional[int]
    breakdowns: Optional[List[Breakdown]]
    remark: str = None
    assignments: Optional[List[Assignment]] = None


class PackingResultWithAssignProps(PackingResult):
    assign_boxes: Optional[float]
    assign_stems: Optional[float]


class PackingResultSummaryForCalendar(PackingResultBase):
    assign_boxes: Optional[float]
    assign_stems: Optional[float]


class ProductWithPackingResult(Schema):
    item: Master
    variety: Optional[Master]
    size: Optional[Master]
    quality: Optional[Master]
    packing_result: Optional[PackingResultWithAssignProps]
