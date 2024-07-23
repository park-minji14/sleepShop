package com.sgsg.dra.state;

public enum OrderState {
	WAITING_PAYMENT("입금대기"), // 0
    PAYMENT_COMPLETED("결제완료"),
    PROCESSING_SHIPMENT("발송처리"),
    SHIPMENT_STARTED("배송시작"),
    IN_TRANSIT("배송중"),
    DELIVERED("배송완료"), // 5
    DELIVERY_FAILED("배송실패"),
    BOUNCED("반송됨"),
    PURCHASE_CONFIRMED("구매확정"),
    CANCELED("판매취소"),
    RETURN_ACCEPTANCE("반품접수"), //10
    RETURN_COMPLETED("반품완료"),
    REFUND_RECEIVED("환불접수"),
    REFUND_COMPLETED("환불완료"),
    EXCHANGE_RECEPTION("교환접수"),
    EXCHANGE_COMPLETED("교환완료"), // 15
    REQUEST_CANCELLATION("요청취소");

    private final String korean;

    OrderState(String korean) {
        this.korean = korean;
    }

    public String getKorean() {
        return korean;
    }

    public static OrderState fromKorean(String korean) {
        for (OrderState status : values()) {
            if (status.getKorean().equals(korean)) {
                return status;
            }
        }
        throw new IllegalArgumentException("Unknown status: " + korean);
    }
    
    public static OrderState fromInt(int num) {
    	 for (OrderState status : values()) {
             if (status.ordinal() == num) {
                 return status;
             }
         }
    	 throw new IllegalArgumentException("Unknown status: " + num);
	}
    
}
