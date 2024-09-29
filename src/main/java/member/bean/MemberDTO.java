package member.bean;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberDTO {
	private Long seq_member;
	private String name;
	private String id;
	private String password;
	private String gender;
	private String email;  // email1 + email2
	private String phoneNumber; // tel1+tel2+tel3
	private String zipcode;
	private String address;  // add1 + add2
	private Date logtime;
}
