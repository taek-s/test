<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/include-taglib.jspf" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>


    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('MEM_ZIP').value = data.zonecode;
                document.getElementById("MEM_ADD1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("MEM_ADD2").focus();
            }
        }).open();
    }
</script>
  </head>
  <body>
  
<!-- modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" data-bs-backdrop="static" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">이메일 인증</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <form id="modalForm" name="modalForm" action="#">
      
      <div class="modal-body">
          <div class="mb-3">
            <label for="authentication" class="col-form-label">입력하신 이메일로</label>
            <label for="authentication" class="col-form-label mb-2">인증번호를 발송하였습니다.</label>
            <input type="text" class="form-control mail-check-input" id="authentication" name="authentication" placeholder="인증번호를 입력하세요" maxlength="6">
			<span id="mail-check-warn"></span>
          </div>
      </div>
      
      <div class="modal-footer">
        <button id="authBtn" type="button" class="btn btn-primary d-none" data-bs-dismiss="modal">인증</button>
      </div>
      
      </form>
      
    </div>
  </div>
</div>
<!-- modal end -->
  
    <div class="container text-start pt-5 pb-5">
      <div class="row text-center mb-4">
        <h2 class="fs-1 fw-semibold">
          회원 가입
        </h2>
      </div>

      <form id="joinForm" class="needs-validation" novalidate>
        <div class="mb-3 row justify-content-center">
          <label for="staticEmail" class="col-2 col-form-label"
            >아이디(이메일)*</label
          >
          <div class="col-6">
            <input type="email" class="form-control" id="MEM_EMAIL" name="MEM_EMAIL" placeholder="ex) abc123@naver.com"
            pattern="^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$" required />
            <div id="email-null" class="invalid-feedback">
		      이메일을 입력해주세요
		  	</div>
            <div id="email-type" class="invalid-feedback">
		      이메일 형식을 확인해주세요
		  	</div>
		  	<div id="email-auth" class="invalid-feedback">
		      이메일 인증이 필요합니다
		  	</div>
          </div>
          <div class="col-2">
            <button id="mail-Check-Btn" type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="이메일 인증">인증</button>
          </div>
        </div>

        <div class="mb-3 row justify-content-center">
          <label for="inputPassword" class="col-2 col-form-label"
            >비밀번호*</label
          >
          <div class="col-6">
            <input type="password" class="form-control" id="MEM_PW" name="MEM_PW" minlength="8" maxlength="16"
            placeholder="특수문자, 문자, 숫자 포함 형태의 8~16자리 이내" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" required />
            <div id="pw-null" class="invalid-feedback">
		      비밀번호를 입력해주세요
		  	</div>
		  	<div id="pw-type" class="invalid-feedback">
		      비밀번호 형식이 올바르지 않습니다
		  	</div>
          </div>
          <div class="col-2"></div>
        </div>

        <div class="mb-3 row justify-content-center">
          <label for="inputPassword" class="col-2 col-form-label"
            >비밀번호 확인*</label
          >
          <div class="col-6">
            <input type="password" class="form-control" id="MEM_PW2" name="MEM_PW2" minlength="8" maxlength="16"
            pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" required />
            <div id="pw2-null" class="invalid-feedback">
		      비밀번호 확인이 필요합니다
		  	</div>
            <div id="pw2-same" class="invalid-feedback">
		      비밀번호가 일치하지 않습니다
		  	</div>
          </div>
          <div class="col-2"></div>
        </div>

        <div class="mb-3 row justify-content-center">
          <label for="staticEmail" class="col-2 col-form-label">이름*</label>
          <div class="col-6">
            <input class="form-control" type="text" value="" id="MEM_NAME" name="MEM_NAME" minlength="2" maxlength="6" required/>
            <div class="invalid-feedback">
		      이름을 입력해주세요
		  	</div>
          </div>
          <div class="col-2"></div>
        </div>

        <div class="mb-3 row justify-content-center">
          <label for="staticEmail" class="col-2 col-form-label"
            >닉네임*</label
          >
          <div class="col-6">
            <input class="form-control" type="text" value="" id="MEM_NICKNAME" name="MEM_NICKNAME" minlength="2" maxlength="16" required/>
            <div id="nick-null" class="invalid-feedback">
		      닉네임을 입력해주세요
		  	</div>
            <div id="nick-check" class="invalid-feedback">
		      닉네임 중복확인이 필요합니다
		  	</div>
		  	<div id="nick-duplicate" class="invalid-feedback">
		      중복된 닉네임입니다. 다른 닉네임을 입력해주세요
		  	</div>
		  	<div id="nick-ok" class="valid-feedback">
		      사용 가능한 닉네임입니다
		  	</div>
          </div>
          
          <div class="col-2">
            <button type="button" class="btn btn-secondary" id="nicknameCheck" name="nicknameCheck">중복확인</button>
          </div>
        </div>

        <div class="mb-3 row justify-content-center">
          <label for="staticEmail" class="col-2 col-form-label"
            >생년월일*</label
          >
          <div class="col-3">
            <input class="form-control" type="text" value="" id="MEM_BIRTH" name="MEM_BIRTH"
            pattern="([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))" minlength="6" maxlength="6" required />
            <div id="birth-null" class="invalid-feedback">
		      생년월일을 입력해주세요
		  	</div>
		  	<div id="birth-type" class="invalid-feedback">
		      생년월일이 잘못 입력되었습니다
		  	</div>
          </div>
          -
          <div class="col-3">
            <div class="row justify-content-around">
		            <input class="form-control col-3" type="text" value="" id="MEM_GEN" name="MEM_GEN" pattern="[1-4]" minlength="1" maxlength="1" placeholder="1~4" required />
				  	<input class="form-control col-7" type="text" value="*  *  *  *  *  *" readonly />
			</div>
			<div class="row">
				  	<div id="gen-null" class="invalid-feedback">
				      성별 값을 입력해주세요
				  	</div>
				  	<div id="gen-type" class="invalid-feedback">
				      성별 값이 잘못 입력되었습니다
				  	</div>
		  	</div>
          </div>
          	
          <div class="col-2"></div>
        </div>

        <div class="mb-3 row justify-content-center">
          <label for="staticEmail" class="col-2 col-form-label"
            >휴대폰 번호*</label
          >
          <div class="col-2">
            <input type="text" class="form-control" id="MEM_PHONE1" name="MEM_PHONE1" pattern="^01([0|1|6|7|8|9])$" minlength="3" maxlength="3" required/>
            <div id="phone-null" class="invalid-feedback">
		      전화번호를 입력해주세요
		  	</div>
		  	<div id="phone-type" class="invalid-feedback">
		      01*의 형식으로 입력해주세요
		  	</div>
          </div>
          -
          <div class="col-2">
            <input type="text" class="form-control" id="MEM_PHONE2" name="MEM_PHONE2" pattern="[0-9]+" minlength="4" maxlength="4" required/>
          	<div class="invalid-feedback">
		      전화번호를 입력해주세요
		  	</div>
          </div>
          -
          <div class="col-2">
            <input type="text" class="form-control" id="MEM_PHONE3" name="MEM_PHONE3" pattern="[0-9]+" minlength="4" maxlength="4" required/>
          	<div class="invalid-feedback">
		      전화번호를 입력해주세요
		  	</div>
          </div>
          <div class="col-2"></div>
        </div>

        <div class="mb-3 row justify-content-center">
          <label for="staticEmail" class="col-2 col-form-label"
            >우편번호</label
          >

          <div class="col-6">
            <input class="form-control" type="text" id="MEM_ZIP" name="MEM_ZIP" placeholder="우편번호" /> <!-- 1 -->
          </div>

          <div class="col-2">
          	<!-- 다음API 적용 예정 -->
            <button type="button" class="btn btn-primary" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">우편번호 검색</button>
          </div>
        </div>

        <div class="mb-3 row justify-content-center">
          <label for="inputPassword" class="col-2 col-form-label"
            >주소</label
          >
          <div class="col-6">
            <input type="text" class="form-control" id="MEM_ADD1" name="MEM_ADD1"  placeholder="주소" /> <!-- 2 -->
          </div>
          <div class="col-2"></div>
        </div>

        <div class="mb-3 row justify-content-center">
          <label for="inputPassword" class="col-2 col-form-label"
            >상세주소</label
          >
          <div class="col-6">
            <input type="text" class="form-control" id="MEM_ADD2" name="MEM_ADD2" placeholder="상세주소" /> <!-- 3 -->
          </div>
          <div class="col-2"></div>
        </div>
        

        <div class="row mb-4 mt-4 justify-content-center">
          <div class="col-10">
          	<label for="inputPassword" class="col-2 col-form-label" style="padding-left:0px; font-weight: bold;"
	            >약관 동의</label
	          >
            <textarea
              class="form-control"
              id="exampleFormControlTextarea1"
              rows="7"
              readonly
            >제1조(목적) 이 약관은 업체 회사(전자상거래 사업자)가 운영하는 업체 사이버 내사남사(이하 내사남사라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 내사남사와 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.
 
  ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」
 
제2조(정의)
 
  ①내사남사란 업체 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버내사남사를 운영하는 사업자의 의미로도 사용합니다.
 
  ② “이용자”란 내사남사에 접속하여 이 약관에 따라 내사남사가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
 
  ③ ‘회원’이라 함은 내사남사에 회원등록을 한 자로서, 계속적으로 내사남사가 제공하는 서비스를 이용할 수 있는 자를 말합니다.
 
  ④ ‘비회원’이라 함은 회원에 가입하지 않고 내사남사가 제공하는 서비스를 이용하는 자를 말합니다.
 
제3조 (약관 등의 명시와 설명 및 개정) 
 
  ①내사남사는 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자 등을 이용자가 쉽게 알 수 있도록 내사남사의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
 
  ② 내사남사는 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
 
  ③내사남사는 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
 
  ④내사남사가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 내사남사의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다.  이 경우 내사남사는 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. 
 
  ⑤내사남사가 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 내사남사에 송신하여 내사남사의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
 
  ⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 「전자상거래 등에서의 소비자 보호지침」 및 관계법령 또는 상관례에 따릅니다.
 
제4조(서비스의 제공 및 변경) 
 
  ①내사남사는 다음과 같은 업무를 수행합니다.
 
    1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
    2. 구매계약이 체결된 재화 또는 용역의 배송
    3. 기타내사남사가 정하는 업무
 
  ②내사남사는 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.
 
  ③내사남사가 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.
 
  ④전항의 경우내사남사는 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, 내사남사가 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.
 
제5조(서비스의 중단) 
 
  ①내사남사는 컴퓨터 등 정보통신설비의 보수점검․교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
 
  ②내사남사는 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단,내사남사가 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.
 
  ③사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는내사남사는 제8조에 정한 방법으로 이용자에게 통지하고 당초 내사남사에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, 내사남사가 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 내사남사에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.
 
제6조(회원가입) 
 
  ① 이용자는 내사남사가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.
 
  ②내사남사는 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.
 
    1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 내사남사의 회원재가입 승낙을 얻은 경우에는 예외로 한다.
    2. 등록 내용에 허위, 기재누락, 오기가 있는 경우
    3. 기타 회원으로 등록하는 것이내사남사의 기술상 현저히 지장이 있다고 판단되는 경우
 
  ③ 회원가입계약의 성립 시기는 내사남사의 승낙이 회원에게 도달한 시점으로 합니다.
 
  ④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 내사남사에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.
 
제7조(회원 탈퇴 및 자격 상실 등) 
 
  ① 회원은 내사남사에 언제든지 탈퇴를 요청할 수 있으며 내사남사는 즉시 회원탈퇴를 처리합니다.
 
  ② 회원이 다음 각 호의 사유에 해당하는 경우,내사남사는 회원자격을 제한 및 정지시킬 수 있습니다.
 
    1.가입 신청 시에 허위 내용을 등록한 경우
    2.내사남사를 이용하여 구입한 재화 등의 대금, 기타내사남사가용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우
    3.다른 사람의 내사남사 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
    4.내사남사를 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
 
  ③내사남사가 회원 자격을 제한․정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우내사남사는 회원자격을 상실시킬 수 있습니다.
 
  ④내사남사가 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.
 
제8조(회원에 대한 통지)
 
  ①내사남사가 회원에 대한 통지를 하는 경우, 회원이내사남사와 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.
 
  ②내사남사는 불특정다수 회원에 대한 통지의 경우 1주일이상내사남사 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.
 
제9조(구매신청) 
 
  ①내사남사가용자는내사남사상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며,내사남사는 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.
      1. 재화 등의 검색 및 선택
      2. 받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력
      3. 약관내용, 청약철회권이 제한되는 서비스, 배송료․설치비 등의 비용부담과 관련한 내용에 대한 확인
      4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시
         (예, 마우스 클릭)
      5. 재화 등의 구매신청 및 이에 관한 확인 또는내사남사의 확인에 대한 동의
      6. 결제방법의 선택
 
  ②내사남사가 제3자에게 구매자 개인정보를 제공·위탁할 필요가 있는 경우 실제 구매신청 시 구매자의 동의를 받아야 하며, 회원가입 시 미리 포괄적으로 동의를 받지 않습니다. 이 때내사남사는 제공되는 개인정보 항목, 제공받는 자, 제공받는 자의 개인정보 이용 목적 및 보유‧이용 기간 등을 구매자에게 명시하여야 합니다. 다만 「정보통신망이용촉진 및 정보보호 등에 관한 법률」 제25조 제1항에 의한 개인정보 취급위탁의 경우 등 관련 법령에 달리 정함이 있는 경우에는 그에 따릅니다.
 
 
제10조 (계약의 성립)
 
  ① 내사남사는 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.
 
    1. 신청 내용에 허위, 기재누락, 오기가 있는 경우
    2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우
    3. 기타 구매신청에 승낙하는 것이내사남사 기술상 현저히 지장이 있다고 판단하는 경우
 
  ②내사남사의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.
 
  ③내사남사의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.
 
제11조(지급방법)내사남사에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법중 가용한 방법으로 할 수 있습니다. 단,내사남사는 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도  추가하여 징수할 수 없습니다.
 
    1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체 
    2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제
    3. 온라인무통장입금
    4. 전자화폐에 의한 결제
    5. 수령 시 대금지급
    6. 마일리지 등내사남사가 지급한 포인트에 의한 결제
    7.내사남사와 계약을 맺었거나내사남사가 인정한 상품권에 의한 결제  
    8. 기타 전자적 지급 방법에 의한 대금 지급 등
 
제12조(수신확인통지․구매신청 변경 및 취소)
 
  ①내사남사는 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.
 
  ② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고내사남사는 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.
 
제13조(재화 등의 공급)
 
  ①내사남사는 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만,내사남사가 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다.  이때내사남사는 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.
 
  ②내사남사는 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약내사남사가 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만내사남사가 고의․과실이 없음을 입증한 경우에는 그러하지 아니합니다.
 
제14조(환급)내사남사는 이용자가 구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.
 
제15조(청약철회 등)
 
  ①내사남사와 재화등의 구매에 관한 계약을 체결한 이용자는 「전자상거래 등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회를 할 수 있습니다. 다만, 청약철회에 관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다. 
 
  ② 이용자는 재화 등을 배송 받은 경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.
 
    1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)
    2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우
    3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우
    4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우
 
  ③ 제2항제2호 내지 제4호의 경우에내사남사가 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.
 
  ④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.
 
제16조(청약철회 등의 효과)
 
  ①내사남사는 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우내사남사가 이용자에게 재화등의 환급을 지연한때에는 그 지연기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」제21조의2에서 정하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.
 
  ②내사남사는 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.
 
  ③ 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다.내사남사는 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은내사남사가 부담합니다.
 
  ④ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에내사남사는 청약철회 시 그 비용을  누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.
 
제17조(개인정보보호)
 
  ①내사남사는 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다. 
 
  ②내사남사는 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.
 
  ③내사남사는 이용자의 개인정보를 수집·이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 
 
  ④내사남사는 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용·제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.
 
  ⑤내사남사가 제3항과 제4항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.
 
  ⑥ 이용자는 언제든지내사남사가 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며내사남사는 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는내사남사는 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.
 
  ⑦내사남사는 개인정보 보호를 위하여 이용자의 개인정보를 취급하는 자를  최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.
 
  ⑧내사남사 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.
 
  ⑨내사남사는 개인정보의 수집·이용·제공에 관한 동의란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집·이용·제공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집·이용·제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.
 
제18조(“내사남사“의 의무)
 
  ①내사남사는 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화․용역을 제공하는데 최선을 다하여야 합니다.
 
  ②내사남사는 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.
 
  ③내사남사가 상품이나 용역에 대하여 「표시․광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시․광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.
 
  ④내사남사는 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.
 
제19조(회원의 ID 및 비밀번호에 대한 의무)
 
  ① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.
 
  ② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
 
  ③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로내사남사에 통보하고내사남사의 안내가 있는 경우에는 그에 따라야 합니다.
 
제20조(이용자의 의무) 이용자는 다음 행위를 하여서는 안 됩니다.
 
    1. 신청 또는 변경시 허위 내용의 등록
    2. 타인의 정보 도용
    3.내사남사에 게시된 정보의 변경
    4.내사남사가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
    5.내사남사 기타 제3자의 저작권 등 지적재산권에 대한 침해
    6.내사남사 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
    7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 내사남사에 공개 또는 게시하는 행위
 
제21조(연결 “내사남사”와 피연결 “판매자” 간의 관계)
 
  ① 상위 내사남사와 하위 판매자가 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 “내사남사”(웹 사이트)이라고 하고 후자를 피연결 “판매자”(웹사이트)이라고 합니다.
 
  ② 연결 “내사남사”는 피연결 “판매자”가 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결 “내사남사”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.
 
제22조(저작권의 귀속 및 이용제한)
 
  ① 내사남사가 작성한 저작물에 대한 저작권 기타 지적재산권은 내사남사에 귀속합니다.
 
  ② 이용자는 내사남사를 이용함으로써 얻은 정보 중내사남사에게 지적재산권이 귀속된 정보를내사남사의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.
 
  ③내사남사는 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.
 
제23조(분쟁해결)
 
  ①내사남사는 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치․운영합니다.
 
  ②내사남사는 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.
 
  ③내사남사와 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.
 
제24조(재판권 및 준거법)
 
  ①내사남사와 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.
 
  ②내사남사와 이용자 간에 제기된 전자상거래 소송에는 한국법을 적용합니다.
 </textarea>
		<div class="col-10" style="padding:10px 25px;">
 			<input class="form-check-input" type="checkbox"  value="" id="agreement1" required/>
          	<label class="form-check-label" for="agreement">이용약관 동의 (필수)</label>
          </div>
          </div>
        </div>

		 <div class="row mb-4 mt-4 justify-content-center">
          <div class="col-10">
            <textarea
              class="form-control"
              id="exampleFormControlTextarea1"
              rows="7"
              readonly
              >개인정보처리방침

[차례]
1. 총칙
2. 개인정보 수집에 대한 동의
3. 개인정보의 수집 및 이용목적
4. 수집하는 개인정보 항목
5. 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항
6. 목적 외 사용 및 제3자에 대한 제공
7. 개인정보의 열람 및 정정
8. 개인정보 수집, 이용, 제공에 대한 동의철회
9. 개인정보의 보유 및 이용기간
10. 개인정보의 파기절차 및 방법
11. 아동의 개인정보 보호
12. 개인정보 보호를 위한 기술적 대책
13. 개인정보의 위탁처리
14. 의겸수렴 및 불만처리
15. 부 칙(시행일) 

1. 총칙

본 업체 사이트는 회원의 개인정보보호를 소중하게 생각하고, 회원의 개인정보를 보호하기 위하여 항상 최선을 다해 노력하고 있습니다. 
1) 회사는 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」을 비롯한 모든 개인정보보호 관련 법률규정을 준수하고 있으며, 관련 법령에 의거한 개인정보처리방침을 정하여 이용자 권익 보호에 최선을 다하고 있습니다.
2) 회사는 「개인정보처리방침」을 제정하여 이를 준수하고 있으며, 이를 인터넷사이트 및 모바일 어플리케이션에 공개하여 이용자가 언제나 용이하게 열람할 수 있도록 하고 있습니다.
3) 회사는 「개인정보처리방침」을 통하여 귀하께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.
4) 회사는 「개인정보처리방침」을 홈페이지 첫 화면 하단에 공개함으로써 귀하께서 언제나 용이하게 보실 수 있도록 조치하고 있습니다.
5) 회사는  「개인정보처리방침」을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.

2. 개인정보 수집에 대한 동의

귀하께서 본 사이트의 개인정보보호방침 또는 이용약관의 내용에 대해 「동의 한다」버튼 또는 「동의하지 않는다」버튼을 클릭할 수 있는 절차를 마련하여, 「동의 한다」버튼을 클릭하면 개인정보 수집에 대해 동의한 것으로 봅니다.

3. 개인정보의 수집 및 이용목적

본 사이트는 다음과 같은 목적을 위하여 개인정보를 수집하고 있습니다.
서비스 제공을 위한 계약의 성립 : 본인식별 및 본인의사 확인 등
서비스의 이행 : 상품배송 및 대금결제
회원 관리 : 회원제 서비스 이용에 따른 본인확인, 개인 식별, 연령확인, 불만처리 등 민원처리
기타 새로운 서비스, 신상품이나 이벤트 정보 안내
단, 이용자의 기본적 인권 침해의 우려가 있는 민감한 개인정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록, 건강상태 등)는 수집하지 않습니다.

4. 수집하는 개인정보 항목

본 사이트는 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다. 
1) 개인정보 수집방법 : 홈페이지(회원가입)
2) 수집항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 전화번호 , 주소 , 휴대전화번호 , 이메일 , 주민등록번호 , 접속 로그 , 접속 IP 정보 , 결제기록


5. 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항

본 사이트는 귀하에 대한 정보를 저장하고 수시로 찾아내는 '쿠키(cookie)'를 사용합니다. 쿠키는 웹사이트가 귀하의 컴퓨터 브라우저(넷스케이프, 인터넷 익스플로러 등)로 전송하는 소량의 정보입니다. 귀하께서 웹사이트에 접속을 하면 본 사이트의 컴퓨터는 귀하의 브라우저에 있는 쿠키의 내용을 읽고, 귀하의 추가정보를 귀하의 컴퓨터에서 찾아 접속에 따른 성명 등의 추가 입력 없이 서비스를 제공할 수 있습니다.
1) 쿠키는 귀하의 컴퓨터는 식별하지만 귀하를 개인적으로 식별하지는 않습니다. 또한 귀하는 쿠키에 대한 선택권이 있습니다. 웹브라우저의 옵션을 조정함으로써 모든 쿠키를 다 받아들이거나, 쿠키가 설치될 때 통지를 보내도록 하거나, 아니면 모든 쿠키를 거부할 수 있는 선택권을 가질 수 있습니다.
2) 쿠키 등 사용 목적 : 이용자의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공
3) 쿠키 설정 거부 방법 : 쿠키 설정을 거부하는 방법으로는 귀하가 사용하는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다. 설정방법 예시 : 인터넷 익스플로어의 경우 → 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보
단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.

6 목적 외 사용 및 제3자에 대한 제공

본 사이트는 귀하의 개인정보를 "개인정보의 수집목적 및 이용목적"에서 고지한 범위 내에서 사용하며, 동 범위를 초과하여 이용하거나 타인 또는 타 기업·기관에 제공하지 않습니다.
그러나 보다 나은 서비스 제공을 위하여 귀하의 개인정보를 업체 자회사 또는 제휴사에게 제공하거나, 업체 자회사 또는 제휴사와 공유할 수 있습니다. 개인정보를 제공하거나 공유할 경우에는 사전에 귀하께 업체 자회사 그리고 제휴사가 누구인지, 제공 또는 공유되는 개인정보항목이 무엇인지, 왜 그러한 개인정보가 제공되거나 공유되어야 하는지, 그리고 언제까지 어떻게 보호·관리되는지에 대해 개별적으로 전자우편 및 서면을 통해 고지하여 동의를 구하는 절차를 거치게 되며, 귀하께서 동의하지 않는 경우에는 업체 자회사 그리고 제휴사에게 제공하거나 공유하지 않습니다. 또한 이용자의 개인정보를 원칙적으로 외부에 제공하지 않으나, 아래의 경우에는 예외로 합니다.
1) 이용자들이 사전에 동의한 경우
2) 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우

7. 개인정보의 열람 및 정정

귀하는 언제든지 등록되어 있는 귀하의 개인정보를 열람하거나 정정하실 수 있습니다. 개인정보 열람 및 정정을 하고자 할 경우에는 "회원정보수정"을 클릭하여 직접 열람 또는 정정하거나, 개인정보 최고관리책임자에게 E-mail로 연락하시면 조치하겠습니다.
귀하가 개인정보의 오류에 대한 정정을 요청한 경우, 정정을 완료하기 전까지 당해 개인정보를 이용하지 않습니다.

8. 개인정보 수집, 이용, 제공에 대한 동의철회

회원가입 등을 통해 개인정보의 수집, 이용, 제공에 대해 귀하께서 동의하신 내용을 귀하는 언제든지 철회하실 수 있습니다. 동의철회는 "마이페이지"의 "회원탈퇴(동의철회)"를 클릭하거나 개인정보관리책임자에게 E-mail등으로 연락하시면 즉시 개인정보의 삭제 등 필요한 조치를 하겠습니다.
본 사이트는 개인정보의 수집에 대한 회원탈퇴(동의철회)를 개인정보 수집시와 동등한 방법 및 절차로 행사할 수 있도록 필요한 조치를 하겠습니다.

9. 개인정보의 보유 및 이용기간

원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.
1) 보존 항목 : 회원가입정보(로그인ID, 이름, 별명)
2) 보존 근거 : 회원 탈퇴 시 다른 회원이 기존 회원아이디로 재가입하여 활동하지 못하도록 하기 위함
3) 보존 기간 : 영구
그리고 상법 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 거래 및 회원정보를 보관합니다.
⚪보존 항목 : 계약 또는 청약철회 기록, 대금 결제 및 재화공급 기록, 불만 또는 분쟁처리 기록
⚪보존 근거 : 전자상거래등에서의 소비자보호에 관한 법률 제6조 거래기록의 보존
⚪보존 기간 : 계약 또는 청약철회 기록(5년), 대금 결제 및 재화공급 기록(5년), 불만 또는 분쟁처리 기록(3년), 위 보유기간에도 불구하고 계속 보유하여야 할 필요가 있을 경우에는 귀하의 동의를 받겠습니다.
⚪회원이 1년간 서비스 이용기록이 없는 경우[정보통신망 이용촉진 및 정보보호 등에 관한 법률] 제 29조 '개인정보 유효 기간제'에 따라 회원에게 사전 통지하고 별도로 분리하여 저장합니다. 
4) 개인정보의 국외 보관에 대한 내용
 회사는 이용자로부터 취득 또는 생성한 개인정보를 미리내가 보유하고 있는 데이터베이스 (물리적보관소: 한국)에 저장합니다. 미리내는 해당 서버의 물리적인 관리만을 행하고, 원칙적으로 회원님의 개인정보에 접근하지 않습니다. 


⚪이전항목: 서비스 이용기록 또는 수집된 개인정보
⚪이전국가: 한국
⚪이전일시 및 방법: 전산 서버 수탁계약 이후 서비스 이용 시점에 네트워크를 통한 전송
⚪개인정보 보유 및 이용기간: 회원탈퇴시 혹은 위탁계약 종료시까지 

10. 개인정보의 파기절차 및 방법

본 사이트는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.
파기절차 : 귀하가 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다. 별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다.
파기방법 : 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.

11. 아동의 개인정보 보호

본 사이트는 만14세 미만 아동의 개인정보를 수집하는 경우 법정대리인의 동의를 받습니다.
만14세 미만 아동의 법정대리인은 아동의 개인정보의 열람, 정정, 동의철회를 요청할 수 있으며, 이러한 요청이 있을 경우 본 사이트는 지체 없이 필요한 조치를 취합니다.

12. 개인정보 보호를 위한 기술적 대책

본 사이트는 귀하의 개인정보를 취급함에 있어 개인정보가 분실, 도난, 누출, 변조 또는 훼손되지 않도록 안전성 확보를 위하여 다음과 같은 기술적 대책을 강구하고 있습니다.
귀하의 개인정보는 비밀번호에 의해 보호되며, 파일 및 전송 데이터를 암호화하거나 파일 잠금기능(Lock)을 사용하여 중요한 데이터는 별도의 보안기능을 통해 보호되고 있습니다.
본 사이트는 백신프로그램을 이용하여 컴퓨터바이러스에 의한 피해를 방지하기 위한 조치를 취하고 있습니다. 백신프로그램은 주기적으로 업데이트되며 갑작스런 바이러스가 출현할 경우 백신이 나오는 즉시 이를 제공함으로써 개인정보가 침해되는 것을 방지하고 있습니다.
해킹 등에 의해 귀하의 개인정보가 유출되는 것을 방지하기 위해, 외부로부터의 침입을 차단하는 장치를 이용하고 있습니다.

13. 개인정보의 위탁처리
본 사이트는 서비스 향상을 위해서 귀하의 개인정보를 외부에 위탁하여 처리할 수 있습니다.
개인정보의 처리를 위탁하는 경우에는 미리 그 사실을 귀하에게 고지하겠습니다.
개인정보의 처리를 위탁하는 경우에는 위탁계약 등을 통하여 서비스제공자의 개인정보보호 관련 지시 엄수, 개인정보에 관한 비밀유지, 제3자 제공의 금지 및 사고시의 책임부담 등을 명확히 규정하고 당해 계약내용을 서면 또는 전자적으로 보관하겠습니다.

14. 의견수렴 및 불만처리
본 사이트는 개인정보보호와 관련하여 귀하가 의견과 불만을 제기할 수 있는 창구를 개설하고 있습니다. 개인정보와 관련한 불만이 있으신 분은 본 사이트의 개인정보 최고 관리책임자에게 의견을 주시면 접수 즉시 조치하여 처리결과를 통보해 드립니다.
1) 개인정보 최고 관리책임자는 회사의 대표가 직접 맡아서 개인정보에 대한 강조를 하고 있습니다. 개인정보를 보호하고 유출을 방지하는 책임자로서 이용자가 안심하고 회사가 제공하는 서비스를 이용할 수 있도록 도와드리며, 개인정보를 보호하는데 있어 이용자에게 고지한 사항들에 반하여 사고가 발생할 시에는 이에 관한 책임을 집니다.
2) 기술적인 보완조치를 취하였음에도 불구하고 악의적인 해킹 등 기본적인 네트워크상의 위험성에 의해 발생하는 예기치 못한 사고로 인한 정보의 훼손 및 멸실, 이용자가 작성한 게시물에 의한 각종 분쟁 등에 관해서는, 본 사이트 회사는 책임이 없습니다.
3) 회사는 정보통신망 이용촉진 및 정보보호 등에 관한 법률에서 규정한 관리책임자를 다음과 같이 지정합니다.
개인정보 최고 관리책임자 성명 : 
전화번호 :
이메일 : 

또는 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.
개인분쟁조정위원회 (www.1336.or.kr / 1336)
정보보호마크인증위원회 (www.eprivacy.or.kr / 02-580-0533~4)
대검찰청 인터넷범죄수사센터 (icic.sppo.go.kr / 02-3480-3600)
경찰청 사이버테러대응센터 (www.ctrc.go.kr / 02-392-0330)

15. 부 칙(시행일) 

현 개인정보처리방침은 2023년 1월 26일에 제정되었으며, 정부 및 회사의 정책 또는 보안기술의 변경에 따라 내용의 추가, 삭제 및 수정이 있을 경우에는 개정 최소 7일 전부터 ‘공지사항’란을 통해 고지하며, 본 정책은 시행 일자에 시행됩니다.
1) 공고일자 : 2023년 1월 26일
2) 시행일자 : 2023년 1월 26일 
              </textarea>
		<div class="col-10" style="padding:10px 25px;">
 			<input class="form-check-input" type="checkbox" value="" id="agreement2" required/>
          	<label class="form-check-label" for="agreement">개인정보 수집 및 이용 동의(필수)</label>
          </div>

        <div class="row justify-content-center mb-5">
          <div class="col-12 text-end">
            <button type="submit" class="btn btn-secondary me-3" name="join">회원 가입</button>
            <button type="button" class="btn btn-secondary" onclick="javascript:history.back()">취소</button>
          </div>
        </div>
      </form>
    </div>

<script type="text/javascript">

$(document).ready(function() {
	
	$("#modalForm").keydown(function (event)
		    {
		        if (event.keyCode == '13') {
		            if (window.event)
		            {
		                event.preventDefault();
		                return;
		            }
		        }
		 });
	
	$('#exampleModal').on('show.bs.modal', function (e) {
    	  e.preventDefault();
    });
	
	
	$("button[name='nicknameCheck']").on("click", function(e) { // 닉네임 중복확인
		e.preventDefault();
		fn_nicknameCheck();
	});
	
	/* $("button[name='join']").on("click", function(e) { //
		e.preventDefault();
		fn_checkMember();
	}); */
	
		 	//alert가 fail까지 표시되어 두번 뜸
		   function fn_nicknameCheck() { //함수를 ajax 형식으로 수정 필요
		      
		 	   var memNick = $('#MEM_NICKNAME').val();
		       var MEM_NICKNAME = {MEM_NICKNAME : memNick};
		   
		       if(memNick == null || $.trim(memNick) == "") {
					$("#MEM_NICKNAME").addClass('is-invalid');
						$("#nick-null").show();
						$("#nick-check").hide();
						$("#nick-duplicate").hide();
						$("#MEM_NICKNAME").focus();
						return false;
			   }
			   $("#MEM_NICKNAME").removeClass('is-invalid');
		         
		         $.ajax({
		            url:"<c:url value='/join/nickCheck'/>",
		            type:'get',
		            data:MEM_NICKNAME,
		            success:function(data) {
		               if(data == 'fail') {
		            	    $("#MEM_NICKNAME").addClass('is-invalid');
		            		$("#nick-null").hide();
							$("#nick-check").hide();
							$("#nick-duplicate").show();
							$("#MEM_NICKNAME").focus();
		               } else if(data == 'success') {
		            	    $("#MEM_NICKNAME").removeClass('is-invalid');
		            	    $("#MEM_NICKNAME").addClass('is-valid');
		            	    $("#nick-null").hide();
							$("#nick-check").hide();
							$("#nick-duplicate").hide();
							$("#nick-ok").show();
							$('#nicknameCheck').attr('disabled',true);
							$('#MEM_NICKNAME').attr('readonly',true);
		               }
		            },
		            error:function() {
		               alert("에러입니다.");
		            }
		         });

		   };
	
	$('#mail-Check-Btn').on("click", function(e) {
		const email = $('#MEM_EMAIL').val(); // 이메일 주소값 얻어오기!
		const emailRule = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		
		if(email == null || $.trim(email) == "" || !emailRule.test(email)) {
			$("#MEM_EMAIL").addClass('is-invalid');
			
			if(email == null || $.trim(email) == "") {
				$("#email-type").hide();
				$("#email-null").show();
				$("#email-auth").hide();
				$("#MEM_EMAIL").focus();
				return false;
			} else if (!emailRule.test(email)) {
				$("#email-type").show();
				$("#email-null").hide();
				$("#email-auth").hide();
				$("#MEM_EMAIL").focus();
				return false;
			}
		}
		$("#MEM_EMAIL").removeClass('is-invalid');
		
		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
		
		const emailAuth = function(){
			$.ajax({
				type : 'get',
				url : '/ns/join/emailAuth?email='+email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
				success : function (data) {
					code = data;
					alert('인증번호가 전송되었습니다.')
				}			
			}); // end ajax
		}
		
		$.ajax({
			url:"/ns/join/emailCheck?email="+email,
			type:'get',
			success:function(data) {
				if(data == 'fail') {
	                  alert("이미 가입된 이메일입니다.");
	               } else if(data == 'success') {
	            	   $('#exampleModal').unbind();
	            	   $('#exampleModal').modal('show');
	            	   $('#exampleModal').on('show.bs.modal', function (e) {
		                	  e.preventDefault();
		              	  });
	            	   emailAuth();
	               }
			},
			error:function() {
				alert("에러입니다.");
			}
		});
	}); // end send eamil
	
	// 인증번호 비교 
	// blur -> focus가 벗어나는 경우 발생
	$('.mail-check-input').blur(function () {
		const inputCode = $(this).val();
		const $resultMsg = $('#mail-check-warn');
		
		if(inputCode === code){
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color','green');
			$('#mail-Check-Btn').attr('disabled',true);
			$('#authentication').attr('readonly',true);
			$('#authBtn').removeClass('d-none');
		}else{
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
			$resultMsg.css('color','red');
		}
	});
	
	$("#authBtn").on("click", function(e) { // 닉네임 중복확인
		$("#MEM_EMAIL").attr("readonly", true);
		$("#email-auth").hide();
	});
	
       
});

	//유효성검증
	(() => {
		  'use strict'

		  // Fetch all the forms we want to apply custom Bootstrap validation styles to
		  const forms = document.querySelectorAll('.needs-validation')

		  // Loop over them and prevent submission
		  Array.from(forms).forEach(form => {
		    form.addEventListener('submit', event => {
		    	
		    	var pass = true;
		    	
		      if (!form.checkValidity()) {
		        event.preventDefault();
		        event.stopPropagation();
		        pass = false;
		      }
		      
		      form.classList.add('was-validated')
		      
		      if($("#MEM_EMAIL").attr('readonly') != 'readonly') {
		    	  $("#email-type").hide();
				  $("#email-null").hide();
				  $("#email-auth").show();
			      $("#MEM_EMAIL").focus()
			      event.preventDefault()
		          event.stopPropagation()
		      } else {
		    	  $("#email-auth").hide();
		      }
		      
		      let pwdval = $('#MEM_PW').val()
		      let pwdokval = $('#MEM_PW2').val()
		      let pwdcheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;
		      
		      if(pwdval == null || $.trim(pwdval) == "") {
		    	  $("#pw-null").show();
				  $("#pw-type").hide();
			      $("#MEM_PW").focus();
		      } else if(!pwdcheck.test(pwdval)) {
		    	  $("#pw-null").hide();
				  $("#pw-type").show();
			      $("#MEM_PW").focus();
		      } else {
		    	  $("#pw-null").hide();
				  $("#pw-type").hide();
		      }
		      
		      if(pwdokval == null || $.trim(pwdokval) == "") {
		    	  $("#pw2-null").show();
				  $("#pw2-same").hide();
			      $("#MEM_PW2").focus();
		      } else if(pwdval!==pwdokval) {
		    	  $("#pw2-null").hide();
				  $("#pw2-same").show();
			      $("#MEM_PW2").focus();
		      }
		      
		      
		      if($("#MEM_NICKNAME").attr('readonly') != 'readonly') {
		    	  $("#MEM_NICKNAME").addClass('is-invalid');
		    	  $("#nick-null").hide();
				  $("#nick-check").show();
				  $("#nick-duplicate").hide();
				  $("#nick-ok").hide();
				  $("#MEM_NICKNAME").focus();
				  event.preventDefault()
			      event.stopPropagation()
		      } else {
		    	  $("#nick-check").hide();
		      }
		      
		      
		      var birth = $("#MEM_BIRTH").val();
		      var birthcheck = /([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))/;
		      if(birth == null || $.trim(birth) == "") {
		    	  $("#birth-null").show();
				  $("#birth-type").hide();
			      $("#MEM_BIRTH").focus();
		      } else if(!birthcheck.test(birth)) {
		    	  $("#birth-null").hide();
				  $("#birth-type").show();
			      $("#MEM_BIRTH").focus();
		      }
		      
		      let phone1 = $('#MEM_PHONE1').val()
		      let phonecheck = /^01([0|1|6|7|8|9])$/;
		      
		      if(phone1 == null || $.trim(phone1) == "") {
		    	  $("#phone-null").show();
				  $("#phone-type").hide();
			      $("#MEM_PHONE1").focus();
		      } else if(!phonecheck.test(phone1)) {
		    	  $("#phone-null").hide();
				  $("#phone-type").show();
			      $("#MEM_PHONE1").focus();
		      } else {
		    	  $("#phone-null").hide();
				  $("#phone-type").hide();
		      }
		      
		      var gen = $("#MEM_GEN").val();
		      var gencheck = /[1-4]/;
		      if(gen == null || $.trim(gen) == "") {
		    	  $("#gen-null").show();
				  $("#gen-type").hide();
			      $("#MEM_GEN").focus();
		      } else if(!gencheck.test(gen)) {
		    	  $("#gen-null").hide();
				  $("#gen-type").show();
			      $("#MEM_GEN").focus();
		      } else {
		    	  $("#gen-null").hide();
				  $("#gen-type").hide();
		      }
				
		      if(pass) {
		    	  fn_checkMember();
		      }
		      
		   // joinSuccess.jsp로 회원이름 전송
		   function fn_sendMemName(){
		      var comSubmit = new ComSubmit();
		      var memName = $('#MEM_NAME').val();
		 
		      comSubmit.setUrl("/ns/joinSuccess");  
		      comSubmit.addParam("MEM_NAME", memName);
		      comSubmit.submit();
		   }
		      
		      
		   // 회원가입 가능한지 여부 확인 및 회원가입 폼 데이터 넘겨주기
		  	function fn_checkMember() {
		  		var memEmail = $('#MEM_EMAIL').val();
		  		var memPw = $('#MEM_PW').val();
		  		var memName = $('#MEM_NAME').val();
		  		var memNickname = $('#MEM_NICKNAME').val();
		  		var memBirth = $('#MEM_BIRTH').val();
		  		var memGen = $('#MEM_GEN').val();
		  		var memPhone1 = $('#MEM_PHONE1').val();
		  		var memPhone2 = $('#MEM_PHONE2').val();
		  		var memPhone3 = $('#MEM_PHONE3').val();
		  		var memZip = $('#MEM_ZIP').val();
		  		var memAdd1 = $('#MEM_ADD1').val();
		  		var memAdd2 = $('#MEM_ADD2').val();
		  		
		  	    var formData = new FormData();
		          formData.append("MEM_EMAIL", memEmail);
		          formData.append("MEM_PW", memPw);
		          formData.append("MEM_NAME", memName);
		          formData.append("MEM_NICKNAME", memNickname);
		          formData.append("MEM_BIRTH", memBirth);
		          formData.append("MEM_GEN", memGen);
		          formData.append("MEM_PHONE1", memPhone1);
		          formData.append("MEM_PHONE2", memPhone2);
		          formData.append("MEM_PHONE3", memPhone3);
		          formData.append("MEM_ZIP", memZip);
		          formData.append("MEM_ADD1", memAdd1);
		          formData.append("MEM_ADD2", memAdd2);
		  		
		         $.ajax({ 
		              url:"/ns/joinAvailable",
		              type:"post",
		              data:formData,
		              processData:false,
		              contentType:false,
		              success:function(data){
		                 console.log("탈퇴이력 조회 성공");
		                 
		                 // 회원 탈퇴한지 7일 지나지 않았을 경우 경고창 띄우기
		                 if(data == 'fail') {
		                       alert("탈퇴 후 재가입은 7일 후에 가능합니다.");
		                    } else if(data == 'success') {  // 회원 탈퇴한지 7일 지났을 경우 joinSuccess로 이동
		                  	  fn_sendMemName();
		                    }
		                 },
		  	            error:function() {
		  	               alert("에러입니다.");
		  	            }
		  	  	 });
		  	   }
		    }, false)
		  })
		})()


</script>
    
  </body>
</html>
