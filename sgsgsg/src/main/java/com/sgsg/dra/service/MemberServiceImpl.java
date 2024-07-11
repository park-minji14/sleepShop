package com.sgsg.dra.service;

import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.sgsg.dra.domain.Member;
import com.sgsg.dra.mail.Mail;
import com.sgsg.dra.mail.MailSender;
import com.sgsg.dra.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired // MemberMapper 빈 자동 주입
	private MemberMapper mapper;

	@Autowired // MailSender 빈 자동 주입
	private MailSender mailSender;

	@Autowired
	private BCryptPasswordEncoder bcryptEncoder;

	// 해당 userId를 가진 회원 정보를 조회
	@Override
	public Member loginMember(String userId) {
		Member dto = null; // Member 객체 초기화

		try {
			dto = mapper.loginMember(userId); // Mapper를 통해 userId로 회원 정보 조회
		} catch (Exception e) {
			e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
		}

		return dto; // 조회한 회원 정보 반환
	}

	// 새로운 회원 정보를 데이터베이스에 저장
	@Override
	public void insertMember(Member dto) throws Exception {
		try {
			// 이메일 주소 설정
			if (dto.getEmail1().length() != 0 && dto.getEmail2().length() != 0) {
				// ㄴ dto객체의 Email1,Email2 필드가 빈 문자열이 아닌지 확인
				dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
				// ㄴ Email1과 Email2를 결합하여 Email 필드에 설정
			}

			// 전화번호 설정
			if (dto.getTel1().length() != 0 && dto.getTel2().length() != 0 && dto.getTel3().length() != 0) {
				// ㄴ dto객체의 Tel1,Tel2,Tel3 필드가 빈 문자열이 아닌지 확인
				dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());
				// ㄴ Tel1,Tel2,Tel3를 결합하여 Email 필드에 설정
			}

			// 패스워드 암호화
			String encPwd = bcryptEncoder.encode(dto.getUserPwd());
			dto.setUserPwd(encPwd);
			
			long memberSeq = mapper.memberSeq(); // 새로운 회원 시퀀스 번호 생성
			dto.setMemberIdx(memberSeq); // 시퀀스 번호 설정

			// 회원 정보 저장 (member1, member2 테이블에 동시에 저장)
			mapper.insertMember12(dto);
			
			// 권한 저장
			dto.setAuthority("USER");
			mapper.insertAuthority(dto);
			
		} catch (Exception e) {
			e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
			throw e; // 예외 다시 던지기
		}

	}

	// 회원의 멤버십 상태를 업데이트
	@Override
	public void updateMembership(Map<String, Object> map) throws Exception {
		try {
			mapper.updateMembership(map); // 회원 상태 업데이트
		} catch (Exception e) {
			e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
			throw e; // 예외 다시 던지기
		}

	}

	// 회원의 마지막 로그인 시간을 업데이트
	@Override
	public void updateLastLogin(String userId) throws Exception {
		try {
			mapper.updateLastLogin(userId); // 마지막 로그인 시간 업데이트
		} catch (Exception e) {
			e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
			throw e; // 예외 다시 던지기
		}

	}

	// 회원 정보를 업데이트
	@Override
	public void updateMember(Member dto) throws Exception {
		try {
			// 이메일 주소 설정
			if (dto.getEmail1().length() != 0 && dto.getEmail2().length() != 0) {
				dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
			}

			// 전화번호 설정
			if (dto.getTel1().length() != 0 && dto.getTel2().length() != 0 && dto.getTel3().length() != 0) {
				dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());
			}

			// 패스워드가 변경된 경우에만 member1 테이블의 패스워드를 변경하도록 설정
			mapper.updateMember1(dto);

			mapper.updateMember2(dto); // member2 테이블 업데이트
		} catch (Exception e) {
			e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
			throw e; // 예외 다시 던지기
		}

	}

	// userId로 회원 정보를 조회하여 이메일과 전화번호를 분리한 후 반환
	@Override
	public Member findById(String userId) {
		Member dto = null; // Member 객체 초기화

		try {
			dto = mapper.findById(userId); // userId로 회원 정보 조회

			if (dto != null) {
				if (dto.getEmail() != null) {
					String[] s = dto.getEmail().split("@"); // 이메일 주소 분리
					dto.setEmail1(s[0]);
					dto.setEmail2(s[1]);
				}

				if (dto.getTel() != null) {
					String[] s = dto.getTel().split("-"); // 전화번호 분리
					dto.setTel1(s[0]);
					dto.setTel2(s[1]);
					dto.setTel3(s[2]);
				}
			}

		} catch (Exception e) {
			e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
		}

		return dto; // 조회한 회원 정보 반환
	}

	// memberIdx로 회원 정보를 조회하여 이메일과 전화번호를 분리한 후 반환
	@Override
	public Member findById(long memberIdx) {
		Member dto = null; // Member 객체 초기화

		try {
			dto = mapper.findByMemberIdx(memberIdx); // memberIdx로 회원 정보 조회

			if (dto != null) {
				if (dto.getEmail() != null) {
					String[] s = dto.getEmail().split("@"); // 이메일 주소 분리
					dto.setEmail1(s[0]);
					dto.setEmail2(s[1]);
				}

				if (dto.getTel() != null) {
					String[] s = dto.getTel().split("-"); // 전화번호 분리
					dto.setTel1(s[0]);
					dto.setTel2(s[1]);
					dto.setTel3(s[2]);
				}
			}
		} catch (Exception e) {
			e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
		}

		return dto; // 조회한 회원 정보 반환
	}

	// 회원 정보를 삭제
	@Override
	public void deleteMember(Map<String, Object> map) throws Exception {
		try {
			map.put("membership", 0); // 회원 상태 비활성화
			updateMembership(map); // 회원 상태 업데이트

			mapper.deleteMember2(map); // member2 테이블에서 회원 정보 삭제
			mapper.deleteMember1(map); // member1 테이블에서 회원 정보 삭제
		} catch (Exception e) {
			e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
			throw e; // 예외 다시 던지기
		}

	}

	// 임시 패스워드를 생성하고 회원에게 이메일로 전송
	@Override
	public void generatePwd(Member dto) throws Exception {
		// 10 자리 임시 패스워드 생성
		StringBuilder sb = new StringBuilder();
		Random rd = new Random();
		String s = "!@#$%^&*~-+ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
		for (int i = 0; i < 10; i++) {
			int n = rd.nextInt(s.length());
			sb.append(s.substring(n, n + 1));
		}

		String result;
		result = dto.getUserId() + "님의 새로 발급된 임시 패스워드는 <b>" + sb.toString() + "</b> 입니다.<br>"
				+ "로그인 후 반드시 패스워드를 변경 하시기 바랍니다.";

		Mail mail = new Mail();
		mail.setReceiverEmail(dto.getEmail()); // 수신자 이메일 설정

		mail.setSenderEmail("보내는사람이메일@도메인"); // 발신자 이메일 설정
		mail.setSenderName("관리자"); // 발신자 이름 설정
		mail.setSubject("임시 패스워드 발급"); // 이메일 제목 설정
		mail.setContent(result); // 이메일 내용 설정

		boolean b = mailSender.mailSend(mail); // 이메일 전송

		if (b) {
			dto.setUserPwd(sb.toString()); // 임시 패스워드 설정
			mapper.updateMember1(dto); // member1 테이블 업데이트
		} else {
			throw new Exception("이메일 전송중 오류가 발생했습니다."); // 이메일 전송 오류 시 예외 발생
		}

	}

	@Override
	public boolean isPasswordCheck(String userId, String userPwd) {
		// 패스워드 비교
		Member dto = findById(userId);

		if (dto == null) {
			return false;
		}

		return bcryptEncoder.matches(userPwd, dto.getUserPwd());
	}

	@Override
	public void updatePwd(Member dto) throws Exception {

		if (isPasswordCheck(dto.getUserId(), dto.getUserPwd())) {
			throw new RuntimeException("패스워드가 기존 패스워드와 일치합니다.");
		}

		try {
			String encPwd = bcryptEncoder.encode(dto.getUserPwd());
			dto.setUserPwd(encPwd);

			mapper.updateMember1(dto);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int checkFailureCount(String userId) {
		int result = 0;
		try {
			result = mapper.checkFailureCount(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void updateFailureCount(String userId) throws Exception {
		try {
			mapper.updateFailureCount(userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateFailureCountReset(String userId) throws Exception {
		try {
			mapper.updateFailureCountReset(userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateMemberEnabled(Map<String, Object> map) throws Exception {
		try {
			mapper.updateMemberEnabled(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertMemberState(Member dto) throws Exception {
		try {
			mapper.insertMemberState(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}
}
