from typing import List

from .schema import Schema


class UpdateAuctionDatePayload(Schema):
    value: List[str]


class AuctionDateResponse(UpdateAuctionDatePayload):
    id: int
