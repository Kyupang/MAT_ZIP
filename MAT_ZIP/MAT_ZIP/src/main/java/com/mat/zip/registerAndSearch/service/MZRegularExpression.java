package com.mat.zip.registerAndSearch.service;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Service;

@Service
public class MZRegularExpression {
	public List<String> MZRegularExpress(String resultStr) {
		String resultStr2 = resultStr;

		// 지번주소
		String regex = "(([가-힣]+(시|도)?|[서울]|[인천]|[대구]|[광주]|[부산]|[울산])( |))" // 그룹1
				+ "([가-힣]+(시|군|구)( |))" // 그룹5
				+ "(([가-힣]+(d|d(,|.)d|)+(로|읍|면|동|가|리)(\\d+)?(가)?)( |)?)"// 그룹8
				+ "(\\d{1,4}-?\\d{1,4}( |)?)"; // 그룹14

		String newRegex = "(([가-힣]+(시|도)?|[서울]|[인천]|[대구]|[광주]|[부산]|[울산])( |))" // 그룹1
				+ "([가-힣]+(시|군|구)( |))" // 그룹5
				+ "([가-힣]+(로|동|길)(\\d+)?(길|번길)?( |)?)" // 그룹8,9,10
				+ "(\\d{1,4}( |)?)" + "((-|~)?(\\d+)?( |)?)";
		
		String dateRegex ="(\\d{2,4})(년|\\.|\\/)( |)?(\\d{1,2})(월|\\.|\\/)( |)?(\\d{1,2})((일)( |)?)?";
		
		String timeRegex = "(\\d{1,2})( |)?(\\:)( |)?(\\d{1,2})(( |)?(\\:)( |)?(\\d{1,2}))?";
		
		String phoneRegex = "(\\d{2,3}(-|\\))\\d{3,4}-\\d{4}( |)?)";
		
		
		Matcher matcher = Pattern.compile(regex).matcher(resultStr2);
		Matcher newMatcher = Pattern.compile(newRegex).matcher(resultStr2);
		Matcher dateMatcher = Pattern.compile(dateRegex).matcher(resultStr2);
		Matcher timeMatcher = Pattern.compile(timeRegex).matcher(resultStr2);
		Matcher phoneMatcher = Pattern.compile(phoneRegex).matcher(resultStr2);
		
		List<String> result = new ArrayList<>();
		String jibun = "";
		String doro = "";
		String date ="";
		String time ="";
		String phone = "";
		
		if (matcher.find()) {
			// System.out.println(matcher.group());
			jibun = matcher.group();
		} else {
			//System.out.println("안돼용~1");
			jibun = "Can not";
		}
		if (newMatcher.find()) {
			// System.out.println(newMatcher.group());
			doro = newMatcher.group();
		} else {
			//System.out.println("안돼용~2");
			doro = "Can not";
		}
		//추출 일자 데이터 정형화 시키기
		if (dateMatcher.find()) {
            date = dateMatcher.group();
            date = date.replaceAll("[^0-9]", " ");
            date = date.replaceAll("\\s+", " ").trim();
            
            String[] dateParts = date.split("\\s+"); // Splitting the date into individual parts
			// Transforming the year
			String year = dateParts[0];
			if (year.length() == 4) {
				year = year.substring(2);
			}

			// Transforming the month
			String month = dateParts[1];
			if (month.startsWith("0")) {
				month = month.substring(1);
			}

			// Transforming the day
			String day = dateParts[2];
			if (day.startsWith("0")) {
				day = day.substring(1);
			}

			date = year + " " + month + " " + day;            
        } else {
        	date = "Can not extract date";
        }
		//추출 시간 정형화시키기 
		if (timeMatcher.find()) {
            time = timeMatcher.group();
            time = time.replaceAll("[^0-9]"," ");
            time = time.replaceAll("\\s+"," ").trim();
            
            String[] timeParts = time.split("\\s+"); // Splitting the date into individual parts
            String time2 = timeParts[0];
			if (time2.startsWith("0")) {
				time2 = time2.substring(1);
			}
            
			String minute = timeParts[1];
			if (minute.startsWith("0")) {
				minute = minute.substring(1);
			}

			String second = timeParts[2];
			if (second.startsWith("0")) {
				second = second.substring(1);
			}

			time = time2 + " " + minute + " " + second;
        } else {
        	time = "Can not extract time";
        }
		if (phoneMatcher.find()) {
            phone = phoneMatcher.group();
        } else {
        	phone = "Can not extract store phone number";
        }
		

		result.add(jibun);
		result.add(doro);
		result.add(date);
		result.add(time);
		result.add(phone);
		
		
		return result;
	}
}
