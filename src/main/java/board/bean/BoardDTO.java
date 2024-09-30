package board.bean;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardDTO {
	private long seq_board;
	private long seq_member;
	private String image;
	private String name;
	private String imageSubject;
	private String imageContent;
	private int hit;
	private Date logtime;
}
