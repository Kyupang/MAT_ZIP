	let websocket;
	
	//소켓 연결
	function connect() {
		//소켓 객체 생성
		var wsUri = 'ws://matjavamatzip.click/MAT_ZIP-1.1.0/chatbot';
		websocket = new WebSocket(wsUri);
		//console.log("연결됨" + websocket);
		websocket.onopen = onOpen;
		websocket.onmessage = onMessage;
	}
	
	//웹소켓에 연결되었을때 호출 함수
	function onOpen(){
		console.log("연결 ok: " + websocket);
	}
	
	function sendMessage(element) {
		websocket.send(element.value);
	}
	
	// 메시지 수신
	function onMessage(res) {
		let temp;
		console.log("데이터: " + res);
		
		JSON.parse(res.data).bubbles.forEach(bubble => {
			if(bubble.type == "text") { //text로 넘어오면 전달값 text 생성
				temp = $("<span>", {class: "msgBox"});
				temp.append(
						$("<span>", {text: bubble.data.description})
						);
				temp.append('<br>');
			} else { //template, 버튼으로 생성
				temp = $("<span>", {class: "msgBox"});
				temp.append(
						$("<span>", {text: bubble.data.cover.data.description})
						);
				$('#chatList').append(temp);
				temp.append('<br>');
				
				temp = $("<span>", {class: "msgBox"});
				bubble.data.contentTable.forEach(content => {
					temp.append(
							$("<button>", {
								text: content[0].data.title,
								value: content[0].data.data.action.data.postbackFull,
								class: "suggestBtn",
								onclick: "sendMessage(this)"
								})
							);
				temp.append('<br>');
				}) //foreach
			} //else
				
			$('#chatList').append(temp);
			
			//자동 스크롤 내리는 함수
			$('#chatList').animate({scrollTop: $('#chatList')[0].scrollHeight}, 600);
		})
	} //onMessage
	
	function chatToggle() {
		$('#chatMain').toggle();
		$('#chatOpenBtn').toggle();
	}
	
	function removeHidden(){
        	$('#chatMain').removeAttr('hidden')
        }
        
	
	//jsp 실행과 동시에 연결
	connect();