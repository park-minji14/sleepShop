package com.sgsg.dra.state;

public enum OrderState {
	WAITING_PAYMENT("입금대기"),
    PAYMENT_COMPLETED("결제완료"),
    PROCESSING_SHIPMENT("발송처리"),
    SHIPMENT_STARTED("배송시작"),
    IN_TRANSIT("배송중"),
    DELIVERED("배송완료"),
    CANCELED("판매취소");

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
    
}
