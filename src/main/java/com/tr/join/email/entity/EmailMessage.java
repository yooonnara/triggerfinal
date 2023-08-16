package com.tr.join.email.entity;


import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class EmailMessage {

    private String to; // 수신자
    private String subject; // 메일제목
    private String message; // 메일내용
}

