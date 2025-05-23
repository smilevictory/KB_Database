package org.scoula.travel.domain;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

public class TravelVO {
    private long no;
    private String district;
    private String title;
    private String description;
    private String address;
    private String phone;
}
