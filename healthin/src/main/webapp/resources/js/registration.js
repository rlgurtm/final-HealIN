		var data;
		var connLocation;
		$(document)
				.ready(
						function() {
							data = [
									{
										"countryCode" : "US",
										"phoneCode" : "1",
										"countryName" : "United States",
										"countryNameKo" : "미국",
										"viewOrder" : "1"
									},
									{
										"countryCode" : "CN",
										"phoneCode" : "86",
										"countryName" : "China",
										"countryNameKo" : "중국",
										"viewOrder" : "2"
									},
									{
										"countryCode" : "CA",
										"phoneCode" : "1",
										"countryName" : "Canada",
										"countryNameKo" : "캐나다",
										"viewOrder" : "3"
									},
									{
										"countryCode" : "JP",
										"phoneCode" : "81",
										"countryName" : "Japan",
										"countryNameKo" : "일본",
										"viewOrder" : "4"
									},
									{
										"countryCode" : "AU",
										"phoneCode" : "61",
										"countryName" : "Australia",
										"countryNameKo" : "호주",
										"viewOrder" : "6"
									},
									{
										"countryCode" : "PH",
										"phoneCode" : "63",
										"countryName" : "Philippines",
										"countryNameKo" : "필리핀",
										"viewOrder" : "7"
									},
									{
										"countryCode" : "TH",
										"phoneCode" : "66",
										"countryName" : "Thailand",
										"countryNameKo" : "타이",
										"viewOrder" : "8"
									},
									{
										"countryCode" : "ID",
										"phoneCode" : "62",
										"countryName" : "Indonesia",
										"countryNameKo" : "인도네시아",
										"viewOrder" : "9"
									},
									{
										"countryCode" : "TW",
										"phoneCode" : "886",
										"countryName" : "Taiwan",
										"countryNameKo" : "대만",
										"viewOrder" : "10"
									},
									{
										"countryCode" : "KR",
										"phoneCode" : "82",
										"countryName" : "Korea, Republic of",
										"countryNameKo" : "대한민국",
										"viewOrder" : "11"
									},
									{
										"countryCode" : "GH",
										"phoneCode" : "233",
										"countryName" : "Ghana",
										"countryNameKo" : "가나"
									},
									{
										"countryCode" : "GA",
										"phoneCode" : "241",
										"countryName" : "Gabon",
										"countryNameKo" : "가봉"
									},
									{
										"countryCode" : "GY",
										"phoneCode" : "592",
										"countryName" : "Guyana",
										"countryNameKo" : "가이아나"
									},
									{
										"countryCode" : "GM",
										"phoneCode" : "220",
										"countryName" : "Gambia",
										"countryNameKo" : "감비아"
									},
									{
										"countryCode" : "GP",
										"phoneCode" : "590",
										"countryName" : "Guadeloupe",
										"countryNameKo" : "과들루프"
									},
									{
										"countryCode" : "GT",
										"phoneCode" : "502",
										"countryName" : "Guatemala",
										"countryNameKo" : "과테말라"
									},
									{
										"countryCode" : "GU",
										"phoneCode" : "1671",
										"countryName" : "Guam",
										"countryNameKo" : "괌"
									},
									{
										"countryCode" : "GD",
										"phoneCode" : "1473",
										"countryName" : "Grenada",
										"countryNameKo" : "그레나다"
									},
									{
										"countryCode" : "GR",
										"phoneCode" : "30",
										"countryName" : "Greece",
										"countryNameKo" : "그리스"
									},
									{
										"countryCode" : "GL",
										"phoneCode" : "299",
										"countryName" : "Greenland",
										"countryNameKo" : "그린란드"
									},
									{
										"countryCode" : "GN",
										"phoneCode" : "224",
										"countryName" : "Guinea",
										"countryNameKo" : "기니"
									},
									{
										"countryCode" : "GW",
										"phoneCode" : "245",
										"countryName" : "Guinea-Bissau",
										"countryNameKo" : "기니비사우"
									},
									{
										"countryCode" : "NA",
										"phoneCode" : "264",
										"countryName" : "Namibia",
										"countryNameKo" : "나미비아"
									},
									{
										"countryCode" : "NR",
										"phoneCode" : "674",
										"countryName" : "Nauru",
										"countryNameKo" : "나우루"
									},
									{
										"countryCode" : "NG",
										"phoneCode" : "234",
										"countryName" : "Nigeria",
										"countryNameKo" : "나이지리아"
									},
									{
										"countryCode" : "AQ",
										"phoneCode" : "672",
										"countryName" : "Antarctica",
										"countryNameKo" : "남극"
									},
									{
										"countryCode" : "SS",
										"phoneCode" : "211",
										"countryName" : "South Sudan",
										"countryNameKo" : "남수단"
									},
									{
										"countryCode" : "ZA",
										"phoneCode" : "27",
										"countryName" : "South Africa",
										"countryNameKo" : "남아프리카 공화국"
									},
									{
										"countryCode" : "NL",
										"phoneCode" : "31",
										"countryName" : "Netherlands",
										"countryNameKo" : "네덜란드"
									},
									{
										"countryCode" : "AN",
										"phoneCode" : "599",
										"countryName" : "Netherlands Antilles",
										"countryNameKo" : "네덜란드령 안틸레스"
									},
									{
										"countryCode" : "NP",
										"phoneCode" : "977",
										"countryName" : "Nepal",
										"countryNameKo" : "네팔"
									},
									{
										"countryCode" : "NO",
										"phoneCode" : "47",
										"countryName" : "Norway",
										"countryNameKo" : "노르웨이"
									},
									{
										"countryCode" : "NC",
										"phoneCode" : "687",
										"countryName" : "New Caledonia",
										"countryNameKo" : "누벨칼레도니"
									},
									{
										"countryCode" : "NZ",
										"phoneCode" : "64",
										"countryName" : "New Zealand",
										"countryNameKo" : "뉴질랜드"
									},
									{
										"countryCode" : "NU",
										"phoneCode" : "683",
										"countryName" : "Niue",
										"countryNameKo" : "니우에"
									},
									{
										"countryCode" : "NE",
										"phoneCode" : "227",
										"countryName" : "Niger",
										"countryNameKo" : "니제르"
									},
									{
										"countryCode" : "NI",
										"phoneCode" : "505",
										"countryName" : "Nicaragua",
										"countryNameKo" : "니카라과"
									},
									{
										"countryCode" : "DK",
										"phoneCode" : "45",
										"countryName" : "Denmark",
										"countryNameKo" : "덴마크"
									},
									{
										"countryCode" : "DO",
										"phoneCode" : "1829",
										"countryName" : "Dominican Republic",
										"countryNameKo" : "도미니카 공화국"
									},
									{
										"countryCode" : "DO",
										"phoneCode" : "1809",
										"countryName" : "Dominican Republic",
										"countryNameKo" : "도미니카 공화국"
									},
									{
										"countryCode" : "DO",
										"phoneCode" : "1849",
										"countryName" : "Dominican Republic",
										"countryNameKo" : "도미니카 공화국"
									},
									{
										"countryCode" : "DM",
										"phoneCode" : "1767",
										"countryName" : "Dominica",
										"countryNameKo" : "도미니카 연방"
									},
									{
										"countryCode" : "DE",
										"phoneCode" : "49",
										"countryName" : "Germany",
										"countryNameKo" : "독일"
									},
									{
										"countryCode" : "TP",
										"phoneCode" : "670",
										"countryName" : "East Timor",
										"countryNameKo" : "동티모르"
									},
									{
										"countryCode" : "LA",
										"phoneCode" : "856",
										"countryName" : "Lao People\u0027s Democratic Republic",
										"countryNameKo" : "라오스"
									},
									{
										"countryCode" : "LR",
										"phoneCode" : "231",
										"countryName" : "Liberia",
										"countryNameKo" : "라이베리아"
									},
									{
										"countryCode" : "LV",
										"phoneCode" : "371",
										"countryName" : "Latvia",
										"countryNameKo" : "라트비아"
									},
									{
										"countryCode" : "RU",
										"phoneCode" : "7",
										"countryName" : "Russian Federation",
										"countryNameKo" : "러시아"
									},
									{
										"countryCode" : "LB",
										"phoneCode" : "961",
										"countryName" : "Lebanon",
										"countryNameKo" : "레바논"
									},
									{
										"countryCode" : "LS",
										"phoneCode" : "266",
										"countryName" : "Lesotho",
										"countryNameKo" : "레소토"
									},
									{
										"countryCode" : "RE",
										"phoneCode" : "262",
										"countryName" : "Reunion",
										"countryNameKo" : "레위니옹"
									},
									{
										"countryCode" : "RO",
										"phoneCode" : "40",
										"countryName" : "Romania",
										"countryNameKo" : "루마니아"
									},
									{
										"countryCode" : "LU",
										"phoneCode" : "352",
										"countryName" : "Luxembourg",
										"countryNameKo" : "룩셈부르크"
									},
									{
										"countryCode" : "RW",
										"phoneCode" : "250",
										"countryName" : "Rwanda",
										"countryNameKo" : "르완다"
									},
									{
										"countryCode" : "LY",
										"phoneCode" : "218",
										"countryName" : "Libyan Arab Jamahiriya",
										"countryNameKo" : "리비아"
									},
									{
										"countryCode" : "LT",
										"phoneCode" : "370",
										"countryName" : "Lithuania",
										"countryNameKo" : "리투아니아"
									},
									{
										"countryCode" : "LI",
										"phoneCode" : "423",
										"countryName" : "Liechtenstein",
										"countryNameKo" : "리히텐슈타인"
									},
									{
										"countryCode" : "MG",
										"phoneCode" : "261",
										"countryName" : "Madagascar",
										"countryNameKo" : "마다가스카르"
									},
									{
										"countryCode" : "MQ",
										"phoneCode" : "596",
										"countryName" : "Martinique",
										"countryNameKo" : "마르티니크"
									},
									{
										"countryCode" : "MH",
										"phoneCode" : "692",
										"countryName" : "Marshall Islands",
										"countryNameKo" : "마셜 제도"
									},
									{
										"countryCode" : "YT",
										"phoneCode" : "269",
										"countryName" : "Mayotte",
										"countryNameKo" : "마요트"
									},
									{
										"countryCode" : "MO",
										"phoneCode" : "853",
										"countryName" : "Macau",
										"countryNameKo" : "마카오"
									},
									{
										"countryCode" : "MK",
										"phoneCode" : "389",
										"countryName" : "Macedonia",
										"countryNameKo" : "마케도니아 공화국"
									},
									{
										"countryCode" : "MW",
										"phoneCode" : "265",
										"countryName" : "Malawi",
										"countryNameKo" : "말라위"
									},
									{
										"countryCode" : "MY",
										"phoneCode" : "60",
										"countryName" : "Malaysia",
										"countryNameKo" : "말레이시아"
									},
									{
										"countryCode" : "ML",
										"phoneCode" : "223",
										"countryName" : "Mali",
										"countryNameKo" : "말리"
									},
									{
										"countryCode" : "MX",
										"phoneCode" : "52",
										"countryName" : "Mexico",
										"countryNameKo" : "멕시코"
									},
									{
										"countryCode" : "MC",
										"phoneCode" : "377",
										"countryName" : "Monaco",
										"countryNameKo" : "모나코"
									},
									{
										"countryCode" : "MA",
										"phoneCode" : "212",
										"countryName" : "Morocco",
										"countryNameKo" : "모로코"
									},
									{
										"countryCode" : "MU",
										"phoneCode" : "230",
										"countryName" : "Mauritius",
										"countryNameKo" : "모리셔스"
									},
									{
										"countryCode" : "MR",
										"phoneCode" : "222",
										"countryName" : "Mauritania",
										"countryNameKo" : "모리타니"
									},
									{
										"countryCode" : "MZ",
										"phoneCode" : "258",
										"countryName" : "Mozambique",
										"countryNameKo" : "모잠비크"
									},
									{
										"countryCode" : "ME",
										"phoneCode" : "382",
										"countryName" : "Montenegro",
										"countryNameKo" : "몬테네그로"
									},
									{
										"countryCode" : "MS",
										"phoneCode" : "1664",
										"countryName" : "Montserrat",
										"countryNameKo" : "몬트세랫"
									},
									{
										"countryCode" : "MD",
										"phoneCode" : "373",
										"countryName" : "Moldova, Republic of",
										"countryNameKo" : "몰도바"
									},
									{
										"countryCode" : "MV",
										"phoneCode" : "960",
										"countryName" : "Maldives",
										"countryNameKo" : "몰디브"
									},
									{
										"countryCode" : "MT",
										"phoneCode" : "356",
										"countryName" : "Malta",
										"countryNameKo" : "몰타"
									},
									{
										"countryCode" : "MN",
										"phoneCode" : "976",
										"countryName" : "Mongolia",
										"countryNameKo" : "몽골"
									},
									{
										"countryCode" : "VI",
										"phoneCode" : "1340",
										"countryName" : "Virgin Islands, U.S.",
										"countryNameKo" : "미국령 버진아일랜드"
									},
									{
										"countryCode" : "MM",
										"phoneCode" : "95",
										"countryName" : "Myanmar",
										"countryNameKo" : "미얀마"
									},
									{
										"countryCode" : "FM",
										"phoneCode" : "691",
										"countryName" : "Micronesia, Federated States of",
										"countryNameKo" : "미크로네시아 연방"
									},
									{
										"countryCode" : "VU",
										"phoneCode" : "678",
										"countryName" : "Vanuatu",
										"countryNameKo" : "바누아투"
									},
									{
										"countryCode" : "BH",
										"phoneCode" : "973",
										"countryName" : "Bahrain",
										"countryNameKo" : "바레인"
									},
									{
										"countryCode" : "BB",
										"phoneCode" : "1246",
										"countryName" : "Barbados",
										"countryNameKo" : "바베이도스"
									},
									{
										"countryCode" : "BS",
										"phoneCode" : "1242",
										"countryName" : "Bahamas",
										"countryNameKo" : "바하마"
									},
									{
										"countryCode" : "BD",
										"phoneCode" : "880",
										"countryName" : "Bangladesh",
										"countryNameKo" : "방글라데시"
									},
									{
										"countryCode" : "BM",
										"phoneCode" : "1441",
										"countryName" : "Bermuda",
										"countryNameKo" : "버뮤다"
									},
									{
										"countryCode" : "BJ",
										"phoneCode" : "229",
										"countryName" : "Benin",
										"countryNameKo" : "베냉"
									},
									{
										"countryCode" : "VE",
										"phoneCode" : "58",
										"countryName" : "Venezuela",
										"countryNameKo" : "베네수엘라"
									},
									{
										"countryCode" : "VN",
										"phoneCode" : "84",
										"countryName" : "Vietnam",
										"countryNameKo" : "베트남"
									},
									{
										"countryCode" : "BE",
										"phoneCode" : "32",
										"countryName" : "Belgium",
										"countryNameKo" : "벨기에"
									},
									{
										"countryCode" : "BY",
										"phoneCode" : "375",
										"countryName" : "Belarus",
										"countryNameKo" : "벨라루스"
									},
									{
										"countryCode" : "BZ",
										"phoneCode" : "501",
										"countryName" : "Belize",
										"countryNameKo" : "벨리즈"
									},
									{
										"countryCode" : "BA",
										"phoneCode" : "387",
										"countryName" : "Bosnia and Herzegovina",
										"countryNameKo" : "보스니아 헤르체고비나"
									},
									{
										"countryCode" : "BW",
										"phoneCode" : "267",
										"countryName" : "Botswana",
										"countryNameKo" : "보츠와나"
									},
									{
										"countryCode" : "BO",
										"phoneCode" : "591",
										"countryName" : "Bolivia",
										"countryNameKo" : "볼리비아"
									},
									{
										"countryCode" : "BI",
										"phoneCode" : "257",
										"countryName" : "Burundi",
										"countryNameKo" : "부룬디"
									},
									{
										"countryCode" : "BF",
										"phoneCode" : "226",
										"countryName" : "Burkina Faso",
										"countryNameKo" : "부르키나파소"
									},
									{
										"countryCode" : "BT",
										"phoneCode" : "975",
										"countryName" : "Bhutan",
										"countryNameKo" : "부탄"
									},
									{
										"countryCode" : "MP",
										"phoneCode" : "1670",
										"countryName" : "Northern Mariana Islands",
										"countryNameKo" : "북마리아나 제도"
									},
									{
										"countryCode" : "BG",
										"phoneCode" : "359",
										"countryName" : "Bulgaria",
										"countryNameKo" : "불가리아"
									},
									{
										"countryCode" : "BR",
										"phoneCode" : "55",
										"countryName" : "Brazil",
										"countryNameKo" : "브라질"
									},
									{
										"countryCode" : "BN",
										"phoneCode" : "673",
										"countryName" : "Brunei Darussalam",
										"countryNameKo" : "브루나이"
									},
									{
										"countryCode" : "WS",
										"phoneCode" : "685",
										"countryName" : "Samoa",
										"countryNameKo" : "사모아"
									},
									{
										"countryCode" : "SA",
										"phoneCode" : "966",
										"countryName" : "Saudi Arabia",
										"countryNameKo" : "사우디아라비아"
									},
									{
										"countryCode" : "SM",
										"phoneCode" : "378",
										"countryName" : "San Marino",
										"countryNameKo" : "산마리노"
									},
									{
										"countryCode" : "ST",
										"phoneCode" : "239",
										"countryName" : "Sao Tome and Principe",
										"countryNameKo" : "상투메 프린시페"
									},
									{
										"countryCode" : "PM",
										"phoneCode" : "508",
										"countryName" : "Saint Pierre and Miquelon",
										"countryNameKo" : "생피에르 미클롱"
									},
									{
										"countryCode" : "SN",
										"phoneCode" : "221",
										"countryName" : "Senegal",
										"countryNameKo" : "세네갈"
									},
									{
										"countryCode" : "RS",
										"phoneCode" : "381",
										"countryName" : "Serbia",
										"countryNameKo" : "세르비아"
									},
									{
										"countryCode" : "SC",
										"phoneCode" : "248",
										"countryName" : "Seychelles",
										"countryNameKo" : "세이셸"
									},
									{
										"countryCode" : "LC",
										"phoneCode" : "1758",
										"countryName" : "Saint Lucia",
										"countryNameKo" : "세인트루시아"
									},
									{
										"countryCode" : "VC",
										"phoneCode" : "1784",
										"countryName" : "Saint Vincent and the Grenadines",
										"countryNameKo" : "세인트빈센트 그레나딘"
									},
									{
										"countryCode" : "KN",
										"phoneCode" : "1869",
										"countryName" : "Saint Kitts and Nevis",
										"countryNameKo" : "세인트키츠 네비스"
									},
									{
										"countryCode" : "SH",
										"phoneCode" : "290",
										"countryName" : "Saint Helena",
										"countryNameKo" : "세인트헬레나"
									},
									{
										"countryCode" : "SO",
										"phoneCode" : "252",
										"countryName" : "Somalia",
										"countryNameKo" : "소말리아"
									},
									{
										"countryCode" : "SB",
										"phoneCode" : "677",
										"countryName" : "Solomon Islands",
										"countryNameKo" : "솔로몬 제도"
									},
									{
										"countryCode" : "SD",
										"phoneCode" : "249",
										"countryName" : "Sudan",
										"countryNameKo" : "수단"
									},
									{
										"countryCode" : "SR",
										"phoneCode" : "597",
										"countryName" : "Suriname",
										"countryNameKo" : "수리남"
									},
									{
										"countryCode" : "LK",
										"phoneCode" : "94",
										"countryName" : "Sri Lanka",
										"countryNameKo" : "스리랑카"
									},
									{
										"countryCode" : "SZ",
										"phoneCode" : "268",
										"countryName" : "Swaziland",
										"countryNameKo" : "스와질란드"
									},
									{
										"countryCode" : "SE",
										"phoneCode" : "46",
										"countryName" : "Sweden",
										"countryNameKo" : "스웨덴"
									},
									{
										"countryCode" : "CH",
										"phoneCode" : "41",
										"countryName" : "Switzerland",
										"countryNameKo" : "스위스"
									},
									{
										"countryCode" : "ES",
										"phoneCode" : "34",
										"countryName" : "Spain",
										"countryNameKo" : "스페인"
									},
									{
										"countryCode" : "SK",
										"phoneCode" : "421",
										"countryName" : "Slovakia",
										"countryNameKo" : "슬로바키아"
									},
									{
										"countryCode" : "SI",
										"phoneCode" : "386",
										"countryName" : "Slovenia",
										"countryNameKo" : "슬로베니아"
									},
									{
										"countryCode" : "SY",
										"phoneCode" : "963",
										"countryName" : "Syrian Arab Republic",
										"countryNameKo" : "시리아"
									},
									{
										"countryCode" : "SL",
										"phoneCode" : "232",
										"countryName" : "Sierra Leone",
										"countryNameKo" : "시에라리온"
									},
									{
										"countryCode" : "SX",
										"phoneCode" : "1721",
										"countryName" : "Sint Maarten (Dutch part)",
										"countryNameKo" : "신트마르턴"
									},
									{
										"countryCode" : "SG",
										"phoneCode" : "65",
										"countryName" : "Singapore",
										"countryNameKo" : "싱가포르"
									},
									{
										"countryCode" : "AE",
										"phoneCode" : "971",
										"countryName" : "United Arab Emirates",
										"countryNameKo" : "아랍에미리트"
									},
									{
										"countryCode" : "AW",
										"phoneCode" : "297",
										"countryName" : "Aruba",
										"countryNameKo" : "아루바"
									},
									{
										"countryCode" : "AM",
										"phoneCode" : "374",
										"countryName" : "Armenia",
										"countryNameKo" : "아르메니아"
									},
									{
										"countryCode" : "AR",
										"phoneCode" : "54",
										"countryName" : "Argentina",
										"countryNameKo" : "아르헨티나"
									},
									{
										"countryCode" : "AS",
										"phoneCode" : "1684",
										"countryName" : "American Samoa",
										"countryNameKo" : "아메리칸사모아"
									},
									{
										"countryCode" : "IS",
										"phoneCode" : "354",
										"countryName" : "Iceland",
										"countryNameKo" : "아이슬란드"
									},
									{
										"countryCode" : "HT",
										"phoneCode" : "509",
										"countryName" : "Haiti",
										"countryNameKo" : "아이티"
									},
									{
										"countryCode" : "IE",
										"phoneCode" : "353",
										"countryName" : "Ireland",
										"countryNameKo" : "아일랜드"
									},
									{
										"countryCode" : "AZ",
										"phoneCode" : "994",
										"countryName" : "Azerbaijan",
										"countryNameKo" : "아제르바이잔"
									},
									{
										"countryCode" : "AF",
										"phoneCode" : "93",
										"countryName" : "Afghanistan",
										"countryNameKo" : "아프가니스탄"
									},
									{
										"countryCode" : "AD",
										"phoneCode" : "376",
										"countryName" : "Andorra",
										"countryNameKo" : "안도라"
									},
									{
										"countryCode" : "AL",
										"phoneCode" : "355",
										"countryName" : "Albania",
										"countryNameKo" : "알바니아"
									},
									{
										"countryCode" : "DZ",
										"phoneCode" : "213",
										"countryName" : "Algeria",
										"countryNameKo" : "알제리"
									},
									{
										"countryCode" : "AO",
										"phoneCode" : "244",
										"countryName" : "Angola",
										"countryNameKo" : "앙골라"
									},
									{
										"countryCode" : "AG",
										"phoneCode" : "1268",
										"countryName" : "Antigua and Barbuda",
										"countryNameKo" : "앤티가 바부다"
									},
									{
										"countryCode" : "AI",
										"phoneCode" : "1264",
										"countryName" : "Anguilla",
										"countryNameKo" : "앵귈라"
									},
									{
										"countryCode" : "ER",
										"phoneCode" : "291",
										"countryName" : "Eritrea",
										"countryNameKo" : "에리트레아"
									},
									{
										"countryCode" : "EE",
										"phoneCode" : "372",
										"countryName" : "Estonia",
										"countryNameKo" : "에스토니아"
									},
									{
										"countryCode" : "EC",
										"phoneCode" : "593",
										"countryName" : "Ecuador",
										"countryNameKo" : "에콰도르"
									},
									{
										"countryCode" : "ET",
										"phoneCode" : "251",
										"countryName" : "Ethiopia",
										"countryNameKo" : "에티오피아"
									},
									{
										"countryCode" : "SV",
										"phoneCode" : "503",
										"countryName" : "El Salvador",
										"countryNameKo" : "엘살바도르"
									},
									{
										"countryCode" : "GB",
										"phoneCode" : "44",
										"countryName" : "United Kingdom",
										"countryNameKo" : "영국"
									},
									{
										"countryCode" : "VG",
										"phoneCode" : "1284",
										"countryName" : "Virgin Islands, British",
										"countryNameKo" : "영국령 버진아일랜드"
									},
									{
										"countryCode" : "AC",
										"phoneCode" : "247",
										"countryName" : "Ascension Island",
										"countryNameKo" : "영국령 어센션"
									},
									{
										"countryCode" : "IO",
										"phoneCode" : "246",
										"countryName" : "British Indian Ocean Territory",
										"countryNameKo" : "영국령 인도양 지역"
									},
									{
										"countryCode" : "YE",
										"phoneCode" : "967",
										"countryName" : "Yemen",
										"countryNameKo" : "예멘"
									},
									{
										"countryCode" : "OM",
										"phoneCode" : "968",
										"countryName" : "Oman",
										"countryNameKo" : "오만"
									},
									{
										"countryCode" : "AT",
										"phoneCode" : "43",
										"countryName" : "Austria",
										"countryNameKo" : "오스트리아"
									},
									{
										"countryCode" : "HN",
										"phoneCode" : "504",
										"countryName" : "Honduras",
										"countryNameKo" : "온두라스"
									},
									{
										"countryCode" : "WF",
										"phoneCode" : "681",
										"countryName" : "Wallis and Futuna",
										"countryNameKo" : "왈리스 퓌튀나"
									},
									{
										"countryCode" : "JO",
										"phoneCode" : "962",
										"countryName" : "Jordan",
										"countryNameKo" : "요르단"
									},
									{
										"countryCode" : "UG",
										"phoneCode" : "256",
										"countryName" : "Uganda",
										"countryNameKo" : "우간다"
									},
									{
										"countryCode" : "UY",
										"phoneCode" : "598",
										"countryName" : "Uruguay",
										"countryNameKo" : "우루과이"
									},
									{
										"countryCode" : "UZ",
										"phoneCode" : "998",
										"countryName" : "Uzbekistan",
										"countryNameKo" : "우즈베키스탄"
									},
									{
										"countryCode" : "UA",
										"phoneCode" : "380",
										"countryName" : "Ukraine",
										"countryNameKo" : "우크라이나"
									},
									{
										"countryCode" : "IQ",
										"phoneCode" : "964",
										"countryName" : "Iraq",
										"countryNameKo" : "이라크"
									},
									{
										"countryCode" : "IR",
										"phoneCode" : "98",
										"countryName" : "Iran, Islamic Republic of",
										"countryNameKo" : "이란"
									},
									{
										"countryCode" : "IL",
										"phoneCode" : "972",
										"countryName" : "Israel",
										"countryNameKo" : "이스라엘"
									},
									{
										"countryCode" : "EG",
										"phoneCode" : "20",
										"countryName" : "Egypt",
										"countryNameKo" : "이집트"
									},
									{
										"countryCode" : "IT",
										"phoneCode" : "39",
										"countryName" : "Italy",
										"countryNameKo" : "이탈리아"
									},
									{
										"countryCode" : "IN",
										"phoneCode" : "91",
										"countryName" : "India",
										"countryNameKo" : "인도"
									},
									{
										"countryCode" : "JM",
										"phoneCode" : "1876",
										"countryName" : "Jamaica",
										"countryNameKo" : "자메이카"
									},
									{
										"countryCode" : "ZM",
										"phoneCode" : "260",
										"countryName" : "Zambia",
										"countryNameKo" : "잠비아"
									},
									{
										"countryCode" : "GQ",
										"phoneCode" : "240",
										"countryName" : "Equatorial Guinea",
										"countryNameKo" : "적도 기니"
									},
									{
										"countryCode" : "GE",
										"phoneCode" : "995",
										"countryName" : "Georgia",
										"countryNameKo" : "조지아"
									},
									{
										"countryCode" : "CF",
										"phoneCode" : "236",
										"countryName" : "Central African Republic",
										"countryNameKo" : "중앙아프리카 공화국"
									},
									{
										"countryCode" : "DJ",
										"phoneCode" : "253",
										"countryName" : "Djibouti",
										"countryNameKo" : "지부티"
									},
									{
										"countryCode" : "GI",
										"phoneCode" : "350",
										"countryName" : "Gibraltar",
										"countryNameKo" : "지브롤터"
									},
									{
										"countryCode" : "ZW",
										"phoneCode" : "263",
										"countryName" : "Zimbabwe",
										"countryNameKo" : "짐바브웨"
									},
									{
										"countryCode" : "TD",
										"phoneCode" : "235",
										"countryName" : "Chad",
										"countryNameKo" : "차드"
									},
									{
										"countryCode" : "CZ",
										"phoneCode" : "420",
										"countryName" : "Czech Republic",
										"countryNameKo" : "체코"
									},
									{
										"countryCode" : "CS",
										"phoneCode" : "42",
										"countryName" : "Czechoslovakia",
										"countryNameKo" : "체코슬로바키아"
									},
									{
										"countryCode" : "CL",
										"phoneCode" : "56",
										"countryName" : "Chile",
										"countryNameKo" : "칠레"
									},
									{
										"countryCode" : "CM",
										"phoneCode" : "237",
										"countryName" : "Cameroon",
										"countryNameKo" : "카메룬"
									},
									{
										"countryCode" : "CV",
										"phoneCode" : "238",
										"countryName" : "Cape Verde",
										"countryNameKo" : "카보베르데"
									},
									{
										"countryCode" : "QA",
										"phoneCode" : "974",
										"countryName" : "Qatar",
										"countryNameKo" : "카타르"
									},
									{
										"countryCode" : "KH",
										"phoneCode" : "855",
										"countryName" : "Cambodia",
										"countryNameKo" : "캄보디아"
									},
									{
										"countryCode" : "KE",
										"phoneCode" : "254",
										"countryName" : "Kenya",
										"countryNameKo" : "케냐"
									},
									{
										"countryCode" : "KY",
										"phoneCode" : "1345",
										"countryName" : "Cayman Islands",
										"countryNameKo" : "케이맨 제도"
									},
									{
										"countryCode" : "CR",
										"phoneCode" : "506",
										"countryName" : "Costa Rica",
										"countryNameKo" : "코스타리카"
									},
									{
										"countryCode" : "CI",
										"phoneCode" : "225",
										"countryName" : "Cote D\u0027Ivoire",
										"countryNameKo" : "코트디부아르"
									},
									{
										"countryCode" : "CO",
										"phoneCode" : "57",
										"countryName" : "Colombia",
										"countryNameKo" : "콜롬비아"
									},
									{
										"countryCode" : "CG",
										"phoneCode" : "242",
										"countryName" : "Congo",
										"countryNameKo" : "콩고 공화국"
									},
									{
										"countryCode" : "CD",
										"phoneCode" : "243",
										"countryName" : "Congo, The Democratic Republic of the",
										"countryNameKo" : "콩고 민주 공화국"
									},
									{
										"countryCode" : "CU",
										"phoneCode" : "53",
										"countryName" : "Cuba",
										"countryNameKo" : "쿠바"
									},
									{
										"countryCode" : "KW",
										"phoneCode" : "965",
										"countryName" : "Kuwait",
										"countryNameKo" : "쿠웨이트"
									},
									{
										"countryCode" : "CK",
										"phoneCode" : "682",
										"countryName" : "Cook Islands",
										"countryNameKo" : "쿡 제도"
									},
									{
										"countryCode" : "HR",
										"phoneCode" : "385",
										"countryName" : "Croatia",
										"countryNameKo" : "크로아티아"
									},
									{
										"countryCode" : "KG",
										"phoneCode" : "996",
										"countryName" : "Kyrgyzstan",
										"countryNameKo" : "키르기스스탄"
									},
									{
										"countryCode" : "KI",
										"phoneCode" : "686",
										"countryName" : "Kiribati",
										"countryNameKo" : "키리바시"
									},
									{
										"countryCode" : "CY",
										"phoneCode" : "357",
										"countryName" : "Cyprus",
										"countryNameKo" : "키프로스"
									},
									{
										"countryCode" : "TJ",
										"phoneCode" : "992",
										"countryName" : "Tajikistan",
										"countryNameKo" : "타지키스탄"
									},
									{
										"countryCode" : "TZ",
										"phoneCode" : "255",
										"countryName" : "Tanzania, United Republic of",
										"countryNameKo" : "탄자니아"
									},
									{
										"countryCode" : "TC",
										"phoneCode" : "1649",
										"countryName" : "Turks and Caicos Islands",
										"countryNameKo" : "터크스 케이커스 제도"
									},
									{
										"countryCode" : "TR",
										"phoneCode" : "90",
										"countryName" : "Turkey",
										"countryNameKo" : "터키"
									},
									{
										"countryCode" : "TG",
										"phoneCode" : "228",
										"countryName" : "Togo",
										"countryNameKo" : "토고"
									},
									{
										"countryCode" : "TK",
										"phoneCode" : "690",
										"countryName" : "Tokelau",
										"countryNameKo" : "토켈라우"
									},
									{
										"countryCode" : "TO",
										"phoneCode" : "676",
										"countryName" : "Tonga",
										"countryNameKo" : "통가"
									},
									{
										"countryCode" : "TM",
										"phoneCode" : "993",
										"countryName" : "Turkmenistan",
										"countryNameKo" : "투르크메니스탄"
									},
									{
										"countryCode" : "TN",
										"phoneCode" : "216",
										"countryName" : "Tunisia",
										"countryNameKo" : "튀니지"
									},
									{
										"countryCode" : "TT",
										"phoneCode" : "1868",
										"countryName" : "Trinidad and Tobago",
										"countryNameKo" : "트리니다드 토바고"
									},
									{
										"countryCode" : "PA",
										"phoneCode" : "507",
										"countryName" : "Panama",
										"countryNameKo" : "파나마"
									},
									{
										"countryCode" : "PY",
										"phoneCode" : "595",
										"countryName" : "Paraguay",
										"countryNameKo" : "파라과이"
									},
									{
										"countryCode" : "PK",
										"phoneCode" : "92",
										"countryName" : "Pakistan",
										"countryNameKo" : "파키스탄"
									},
									{
										"countryCode" : "PG",
										"phoneCode" : "675",
										"countryName" : "Papua New Guinea",
										"countryNameKo" : "파푸아 뉴기니"
									},
									{
										"countryCode" : "PW",
										"phoneCode" : "680",
										"countryName" : "Palau",
										"countryNameKo" : "팔라우"
									},
									{
										"countryCode" : "PS",
										"phoneCode" : "970",
										"countryName" : "Palestinian Territory, Occupied",
										"countryNameKo" : "팔레스타인"
									},
									{
										"countryCode" : "FO",
										"phoneCode" : "298",
										"countryName" : "Faroe Islands",
										"countryNameKo" : "페로 제도"
									},
									{
										"countryCode" : "PE",
										"phoneCode" : "51",
										"countryName" : "Peru",
										"countryNameKo" : "페루"
									},
									{
										"countryCode" : "PT",
										"phoneCode" : "351",
										"countryName" : "Portugal",
										"countryNameKo" : "포르투갈"
									},
									{
										"countryCode" : "FK",
										"phoneCode" : "500",
										"countryName" : "Falkland Islands (Malvinas)",
										"countryNameKo" : "포클랜드 제도"
									}, {
										"countryCode" : "PL",
										"phoneCode" : "48",
										"countryName" : "Poland",
										"countryNameKo" : "폴란드"
									}, {
										"countryCode" : "PR",
										"phoneCode" : "1939",
										"countryName" : "Puerto Rico",
										"countryNameKo" : "푸에르토리코"
									}, {
										"countryCode" : "PR",
										"phoneCode" : "1787",
										"countryName" : "Puerto Rico",
										"countryNameKo" : "푸에르토리코"
									}, {
										"countryCode" : "FR",
										"phoneCode" : "33",
										"countryName" : "France",
										"countryNameKo" : "프랑스"
									}, {
										"countryCode" : "GF",
										"phoneCode" : "594",
										"countryName" : "French Guiana",
										"countryNameKo" : "프랑스령 기아나"
									}, {
										"countryCode" : "PF",
										"phoneCode" : "689",
										"countryName" : "French Polynesia",
										"countryNameKo" : "프랑스령 폴리네시아"
									}, {
										"countryCode" : "FJ",
										"phoneCode" : "679",
										"countryName" : "Fiji",
										"countryNameKo" : "피지"
									}, {
										"countryCode" : "FI",
										"phoneCode" : "358",
										"countryName" : "Finland",
										"countryNameKo" : "핀란드"
									}, {
										"countryCode" : "HU",
										"phoneCode" : "36",
										"countryName" : "Hungary",
										"countryNameKo" : "헝가리"
									}, {
										"countryCode" : "HK",
										"phoneCode" : "852",
										"countryName" : "Hong Kong",
										"countryNameKo" : "홍콩"
									} ];
							connLocation = ("KR" != "") ? "KR" : "KR";

							$("#inpNationInfo")
									.autocomplete(
											{
												minLength : 0,
												source : $
														.map(
																data,
																function(item) {
																	return {
																		label : item.countryNameKo
																				+ " / "
																				+ item.countryName,
																		value : item.phoneCode,
																		code : item.countryCode
																	}
																}),
												response : function(event, ui) {
													$(".list_nationinfo")
															.empty();
													if (ui.content.length > 0) {
														$(".list_nationinfo")
																.append(
																		'<ul id="list_nation" class="list_nation"></div');
													} else {
														$(".list_nationinfo")
																.html(
																		'<div class="wrap_nodata"><strong class="tit_nodata">검색 결과가 없습니다.</strong><p class="txt_nodata">검색할 국가명(영문,국문) 또는 국가번호를<br>다시 입력해 주세요.</p></div>');
													}
												},
												open : function(event, ui) {
													$(".ui-autocomplete")
															.hide();
												}

											}).data('uiAutocomplete')._renderItem = function(
									ul, item) {
								var label = item.label;
								if (this.term != "") {
									var re = new RegExp("(" + this.term + ")",
											"gi"), cls = "txt_emph", template = "<span class='" + cls + "'>$1</span>", label = item.label
											.replace(re, template);
								}
								var element = '<a href="javascript:;"  class="item_info"><span class="num_item">(+'
										+ item.value
										+ ')</span>'
										+ label
										+ '</a>';

								return $('<li id="' + item.value + '"></li>')
										.append(element)
										.appendTo(".list_nationinfo")
										.on(
												"click",
												function() {
													$(".link_nationnum").html(
															'+' + item.value);
													countryNo.val(item.value);
													countryCode.val(item.code);
													showObject
															.removeClass("input_on");

												})
										.keyup(
												function(e) {
													if (e.keyCode == 13) {
														$(".link_nationnum")
																.html(
																		'+'
																				+ item.value);
														countryNo
																.val(item.value);
														countryCode
																.val(item.code);
														showObject
																.removeClass("input_on");
													}
												});
							};

							$("#inpNationInfo").autocomplete("search").on(
									"keydown", function(e) {
										if (e.keyCode == 13) {
											return false;
										}
									});

							$(".link_nationnum").on("click", function() {
								showObject.toggleClass("input_on");
							});

							$(document)
									.on(
											"keyup mouseup",
											function(e) {
												if (($('.wrap_nationinfo').has(
														$(e.target)).length == 0)
														&& (e.target.className != 'link_nationnum')) {
													if (showObject
															.hasClass("input_on")) {
														showObject
																.removeClass("input_on");
													}
												}
											});

						});
		var showObject;
		var countryNo;
		var countryCode;

		var initAutoComplete = function(showObj, countryNoObj, countryCodeObj) {
			this.showObject = showObj;
			this.countryNo = countryNoObj;
			this.countryCode = countryCodeObj;
			initConnLocation();
		}

		var initConnLocation = function() {
			$.each(data, function(index, item) {
				if (item.countryCode == connLocation) {
					$('.link_nationinfo').html(
							"(+" + item.phoneCode + ") " + item.countryNameKo
									+ " / " + item.countryName)
							.on(
									"click",
									function() {
										$(".link_nationnum").html(
												'+' + item.phoneCode);
										countryNo.val(item.phoneCode);
										countryCode.val(item.countryCode);
										showObject.removeClass("input_on");

									}).keyup(
									function(e) {
										if (e.keyCode == 13) {
											$(".link_nationnum").html(
													'+' + item.phoneCode);
											countryNo.val(item.phoneCode);
											countryCode.val(item.countryCode);
											showObject.removeClass("input_on");
										}
									});

					$('.link_nationinfo').html(
							"(+" + item.phoneCode + ") " + item.countryNameKo
									+ " / " + item.countryName)
					$(".link_nationnum").html('+' + item.phoneCode);
					countryNo.val(item.phoneCode);
					countryCode.val(item.countryCode);
				}
			});
		}

		var setConnLocation = function(searchCountryNo) {
			if (searchCountryNo == "") {
				return;
			}

			$.each(data, function(index, item) {
				if (item.phoneCode == searchCountryNo) {
					$(".link_nationnum").html('+' + item.phoneCode);
					countryNo.val(item.phoneCode);
					countryCode.val(item.countryCode);
				}
			});
		}
		$(document)
				.ready(
						function() {
							var isPassPW = false;
							var nationalClick = false;

							$("form")
									.initValidation(
											{
												inputEvent : "keydown focus",
												validationEvent : "blur",
												daumId : {
													rules : {
														required : true,
														rangelength : [ 4, 15 ],
														onlydigits : true,
														notUpperCase : true,
														daumidinvalid : true,
														checkjuminnoformat : true,
														uniqueDaumid : {
															pageId : "9414"
														}
													},
													inputListener : function(
															input) {
														formInput(input);
														hideRecommendIds();
													},
													errorListener : function(
															input, result) {
														var extra = result.extra;
														if (extra !== undefined) {
															var uniqueDaumidExtra = extra.uniqueDaumid;
															if (uniqueDaumidExtra !== undefined) {
																if (uniqueDaumidExtra.recommendId1 !== undefined
																		&& uniqueDaumidExtra.recommendId2 !== undefined) {
																	showRecommendIds(
																			uniqueDaumidExtra.recommendId1,
																			uniqueDaumidExtra.recommendId2);
																} else if (uniqueDaumidExtra.responseCode == "403") {
																	redirectFirstPageForError(result.message);
																	return;
																}
															}
														}

														formError(input, result);
													}
												},
												name : {
													rules : {
														required : true,
														strTrim : true,
														nameinvalid : true,
														minKoreanNameLength : true,
														maxKoreanNameLength : true,
														englishnamelength : true
													}
												},
												email : {
													nullable : true,
													rules : {
														strTrim : true,
														notUpperCase : true,
														email : true,
														activeEmail : {
															pageId : "9414"
														}
													},
													errorListener : function(
															input, result) {
														if (result.extra !== undefined) {
															var activeEmailCheckError = result.extra['activeEmail'];
															if (activeEmailCheckError != undefined
																	&& activeEmailCheckError.responseCode == "403") {
																redirectFirstPageForError(result.message);
																return;
															}
														}

														if ($.trim(input.val()) == "") {
															$(input).val("");
															formReset(input);
														} else {
															formError(input,
																	result);
														}
													}
												},
												password1 : {
													inputEvent : "focus",
													validationEvent : "blur keyup",
													rules : {
														pwValid : function() {
															return {
																daumId : "#daumId"
															}
														}
													},
													errorListener : function(
															input, result) {
														if (GlobalValidationInfo.currEventType == "keyup"
																&& input.val() == "") {
															return true;
														}
														isPassPW = false;
														setInputError(input,
																result.message);
														showValidIcon(input)
																.text("불가");
														checkPwReconfirm(input,
																$("#password2"));
													},
													inputListener : function(
															input) {
														if (isPassPW) {
															showTypingBox(input);
															hideErrorMessage($("#password2"));
														}
													},
													successListener : function(
															input, result) {
														isPassPW = true;
														setInputSuccess(input);
														if (result !== undefined
																&& result['pwValid'].extra !== undefined
																&& result['pwValid'].extra.isStrong === true) {
															showValidIcon(input)
																	.addClass(
																			"txt_strong")
																	.text("강력");
														} else {
															showValidIcon(input)
																	.removeClass(
																			"txt_strong")
																	.text("안전");
														}
														checkPwReconfirm(input,
																$("#password2"));
													}
												},
												password2 : {
													inputEvent : "focus",
													resultCaching : false,
													rules : {
														isSameValue : $("#password1")
													},
													errorListener : function(
															input, result) {
														if (isPassPW) {
															passwordNotMatched(input);
														} else {
															hideTypingBox(input);
														}
													},
													successListener : function(
															input) {
														if (isPassPW) {
															passwordMatched(input);
														} else {
															hideTypingBox(input);
														}
													},
													inputListener : function(
															input) {
														if (isPassPW) {
															setInputFocus(input);
															hideValidIcon(input);
														}
													}
												},
												errorListener : formError,
												resetListener : formReset,
												inputListener : formInput,
												successListener : formSuccess
											});

							function formError(input, result) {
								setInputError(input, result.message);
								hideValidIcon(input);
							}

							function formReset(input) {
								setInputReset(input);
								hideValidIcon(input);
							}

							function formInput(input) {
								setInputFocus(input);
								hideValidIcon(input);
							}

							function formSuccess(input) {
								setInputSuccess(input);
								showValidIcon(input);
							}

							function setInputError(input, message) {
								showErrorBox(input);
								showErrorMessage(
										getProperErrorMessageTarget(input),
										message);
							}

							function setInputReset(input) {
								resetBox(input);
							}

							function setInputSuccess(input) {
								if (GlobalValidationInfo.currEventType == "keyup") {
									showTypingBox(input);
								} else {
									showSuccessBox(input);
								}
								hideErrorMessage(getProperErrorMessageTarget(input));
							}

							function setInputFocus(input) {
								showTypingBox(input);
								hideErrorMessage(getProperErrorMessageTarget(input));
							}

							function showValidIcon(input) {
								var target = $(input).siblings(".mark_valid");
								if (target.length > 0) {
									target.show();
								}
								return target;
							}

							function hideValidIcon(input) {
								var target = $(input).siblings(".mark_valid");
								if (target.length > 0) {
									target.hide();
								}
								return target;
							}

							function setInputErrorCert(input, message) {
								showErrorBox(input);
								showErrorMessage(
										getProperErrorMessageTarget(input),
										message);
							}

							$("form input:text, form input:password").focus(
									function() {
										offPlaceHolder(this);
									}).blur(function() {
								onPlaceHolder(this);
							}).on("keyup keypress", function(e) {
								return e.which !== 13;
							});

							function offPlaceHolder(input) {
								$(input).siblings(".txt_placeholder").addClass(
										"screen_out");
							}

							function onPlaceHolder(input) {
								if ($(input).val() == "") {
									$(input).siblings(".txt_placeholder")
											.removeClass("screen_out");
								}
							}

							$("form")
									.submit(
											function() {
												var errorCnt = 0;

												if (!$("form").valid()) {
													errorCnt++;
												}
												if (isAuthenticated != true
														&& $("#inpPhone")
																.isValid() == true) {
													if (!isSendCode) {
														sendCertCodeFail($.fn.messages.sendAndInputCertCode);
													} else {
														confirmCertCodeFail($.fn.messages.inputAndConfirmCertCode);
													}
													errorCnt++;
												}
												if (errorCnt == 0) {
													$("#submitBtn").attr(
															"disabled", true);
													return true;
												}
												return false;
											});

							$("form")
									.keydown(
											function(event) {
												var activeElement = document.activeElement;
												if (event.keyCode === 13
														&& (activeElement.nodeName == 'INPUT' || $(
																activeElement)
																.attr('type') == 'submit')) {
													$(activeElement).blur();
													$("form").submit();
												}
											});

							function showRecommendIds(recommendId1,
									recommendId2) {
								$("#recommendId1").children(".txt_other").html(
										recommendId1);
								$("#recommendId2").children(".txt_other").html(
										recommendId2);
								$("#recommendIds").show();
							}

							function hideRecommendIds() {
								$("#recommendIds").hide();
							}

							var changeToRecommendId = function() {
								hideRecommendIds()
								$("#daumId").val(
										$(this).children(".txt_other").text())
								$("#daumId").blur();
								$("#password1").focus();
							};

							$("#recommendId1").click(changeToRecommendId);
							$("#recommendId2").click(changeToRecommendId);

							function checkPwReconfirm(pw1, pw2) {
								if (pw2.val() == "" || !isPassPW) {
									setInputReset(pw2);
									hideValidIcon(pw2);
								} else {
									if (pw1.val() == pw2.val()) {
										passwordMatched(pw2);
									} else {
										passwordNotMatched(pw2);
									}
								}
							}

							function passwordMatched(input) {
								setInputSuccess(input);
								showValidIcon(input).text("일치");
							}

							function passwordNotMatched(input) {
								setInputError(input,
										$.fn.messages.passwordNotMatched);
								showValidIcon(input).text("불일치");
							}

							var isSendCode = false;
							var isAuthenticated = false;

							$("#inpPhone")
									.initValidation(
											{
												inputEvent : "focus",
												validationEvent : "blur keyup",
												rules : {
													required : true,
													mobile : function() {
														return {
															mobileNationalCode : $(
																	"#mobileNationalCode")
																	.val(),
															mobileNational : $(
																	"#mobileNational")
																	.val(),
															mobileInternationalFormat : "#mobileInternationalFormat"
														}
													}
												},
												errorListener : function(input,
														result) {

													if (nationalClick == true
															&& $(input).val() == "") {
														return true;
													}

													setCertCodeBtnDisable(
															"certBtn", true);
													if (GlobalValidationInfo.currEventType != "keyup") {
														if (result.extra !== undefined) {
															var certcodePolicyCheckError = result.extra['certcodePolicy'];
															if (certcodePolicyCheckError != undefined
																	&& certcodePolicyCheckError.responseCode == "403") {
																redirectFirstPageForError(result.message);
																return;
															}
														}

														setInputErrorCert(
																input,
																result.message);
													}
												},
												inputListener : function(input,
														result) {
													isAuthenticated = false;

													showTypingBoxForAuth(input);

													$("#inpCertCode").val("");
													resetBox($("#inpCertCode"));
													hideErrorMessage($("#inpCertCode"));
													setCertCodeBtnDisable(
															"confirmBtn", true);
													onPlaceHolder($("#inpCertCode"));
													$("#matchedCertCodeText")
															.hide();

													if (isSendCode) {
														$("#inpCertCode").attr(
																"disabled",
																false);
													}
												},
												successListener : function(
														input, result) {
													if (isAuthenticated == false) {
														setCertCodeBtnDisable(
																"certBtn",
																false);
														if (GlobalValidationInfo.currEventType == "blur") {
															showSuccessBox(input);
														}
													}
												}
											});

							$("#numNation").on("mouseenter touchstart",
									function() {
										nationalClick = true;
									});

							$("#numNation").on("mouseleave touchend",
									function() {
										nationalClick = false;
									});

							$("#numNation").on("click touch", function() {
								nationalClick = false;
							});

							// 국가 선택 후 #inpPhone으로 포커싱 -- 보완예정
							//        $("#numNation").on("focusout", function (event) {
							//            console.log("focusout");
							//            console.log("event :"+event.type);
							//            $(".num_nation").trigger("clickNumNation");
							//        });
							//
							//        $("#numNation").on("clickNumNation", function (event) {
							//            console.log("clickNumNation");
							//            console.log("event :"+event.type);
							//            setTimeout(function(){$("#inpPhone").focus();}, 100);
							//        });

							$("#inpCertCode")
									.initValidation(
											{
												inputEvent : "focus",
												validationEvent : "blur keyup",
												rules : {
													required : true,
													onlyNumber : true,
													rangelength : [ 6, 6 ]
												},

												errorListener : function(input,
														result) {
													hideTypingBox(input);
													if ($("#inpPhone")
															.isValid() == true) {
														setCertCodeBtnDisable(
																"confirmBtn",
																true);
														if (GlobalValidationInfo.currEventType != "keyup") {
															setInputErrorCert(
																	input,
																	result.message);
														}
													}
												},
												inputListener : function(input,
														result) {
													showTypingBoxForAuth(input);
													if ($("#inpPhone")
															.isValid() == true) {
														hideErrorMessage($("#inpCertCode"));
													}
												},
												successListener : function(
														input, result) {
													if (GlobalValidationInfo.currEventType == "blur") {
														hideTypingBox($("#inpCertCode"));
													}
													if ($("#inpPhone")
															.isValid()) {
														setCertCodeBtnDisable(
																"confirmBtn",
																false);
													}
												}
											});

							$("#certBtn")
									.click(
											function() {

												if ($("#certBtn").hasClass(
														"disabled")) {
													return false;
												}
												hideTypingBox($("#inpCertCode"));

												//인증번호 발송 정책체크
												var NumberInfo = function() {
													return {
														pageId : "9414",
														eventType : GlobalValidationInfo.currEventType,
														isAuthenticated : isAuthenticated,
														serviceType : "join",
														mobileNationalCode : $(
																"#mobileNationalCode")
																.val(),
														mobileNational : $(
																"#mobileNational")
																.val()
													}
												};
												var val = $.fn.methods
														.certcodePolicy($(
																"#inpPhone")
																.val(), "",
																NumberInfo);

												if (val.result != 'success') {
													$("#inpPhone")
															.showElementError(
																	"inpPhone",
																	val.message);
													if (val.extra !== undefined) {
														if (val.extra.responseCode == "403") {
															redirectFirstPageForError(val.message);
														}
													}
													return false;
												}

												if (confirm($(
														"#mobileInternationalFormat")
														.val()
														+ " 입력하신 번호로 인증번호를 발송합니다.\n번호가 정확한지 확인해 주세요.")) {
													setInputReset($("#inpCertCode"));
													setCertCodeBtnDisable(
															"confirmBtn", true);
													$("#inpCertCode").val("")
															.attr("disabled",
																	true);
													$("#matchedCertCodeText")
															.hide();
													isAuthenticated = false;
													isSendCode = false;

													$
															.post(
																	"https://member.daum.net/api/auth/send.do?v=2",
																	{
																		PAGEID : "9414",
																		serviceType : "join",
																		authType : "phone",
																		mobile : $(
																				"#inpPhone")
																				.val(),
																		countryCode : $(
																				"#mobileNationalCode")
																				.val(),
																		countryNo : $(
																				"#mobileNational")
																				.val()

																	},
																	function(
																			data) {
																		if (data.code == "200") {
																			if (data.message == "OK") {
																				sendCertCodeOK();
																			} else {
																				sendCertCodeFail(data.result.message);
																			}
																		} else if (data.code == "500") {
																			sendCertCodeFail($.fn.messages.failSendCertCode);
																		} else {
																			sendCertCodeFail(data.result.message);
																		}
																	});
												}
											});

							$("#confirmBtn")
									.click(
											function() {

												if ($("#confirmBtn").hasClass(
														"disabled")) {
													return false;
												}

												if ($("#inpCertCode").isValid() == false) {
													$("#inpCertCode").valid();
													return false;
												}

												if ($("#inpPhone").isValid() == false) {
													return false;
												}

												var extra = {};
												$
														.post(
																"https://member.daum.net/api/auth/collate.do?v=2",
																{
																	PAGEID : "9414",
																	serviceType : "join",
																	authType : "phone",
																	inputValue : $(
																			"#inpCertCode")
																			.val(),
																	mobile : $(
																			"#inpPhone")
																			.val(),
																	countryCode : $(
																			"#mobileNationalCode")
																			.val(),
																	countryNo : $(
																			"#mobileNational")
																			.val()

																},
																function(data) {
																	if (data.code == "200") {
																		if (data.message == "MATCH") {
																			confirmCertCodeOK();
																		} else if (data.message == "NOT_MATCH") {
																			confirmCertCodeFail(
																					data.result.message,
																					extra);
																		} else if (data.message == "NOT_VALID") {
																			sendCertCodeFail(data.result.message);
																			$(
																					"#inpCertCode")
																					.val(
																							"");
																		} else {
																			confirmCertCodeFail(
																					data.result.message,
																					extra);
																		}
																	} else if (data.code == '403') {
																		result = 'fail';
																		message = $.fn.messages.invalidAccess
																		extra.responseCode = data.code;
																		confirmCertCodeFail(
																				message,
																				extra);
																	} else if (data.code == "500") {
																		confirmCertCodeFail(
																				$.fn.messages.failConfirmCertCode,
																				extra);
																	} else {
																		confirmCertCodeFail(
																				data.message,
																				extra);
																	}
																});
											});

							function sendCertCodeOK() {
								showSuccessBox($("#inpPhone"));
								$("#certBtn").html("재발송");
								$("#matchedCertCodeText").hide();

								setInputSuccess($("#inpPhone"));
								setInputReset($("#inpCertCode"));
								$("#inpCertCode").val("").attr("disabled",
										false).focus();

								setCertCodeBtnDisable("confirmBtn", true);
								isAuthenticated = false;
								isSendCode = true;
							}

							function sendCertCodeFail(message) {
								setInputError($("#inpPhone"), message);
								setCertCodeBtnDisable("confirmBtn", true);
								showErrorBox($("#inpCertCode"));
							}

							function confirmCertCodeOK() {
								setInputSuccess($("#inpCertCode"));

								$("#inpPhone").attr("disabled", true);
								setCertCodeBtnDisable("certBtn", true);

								$("#inpCertCode").attr("disabled", true);

								setCertCodeBtnDisable("confirmBtn", true);
								$("#matchedCertCodeText").show();
								$(".num_nation").css({
									"pointer-events" : "none"
								});
								isAuthenticated = true;
							}

							function confirmCertCodeFail(message, extra) {
								if (extra !== undefined
										&& extra.responseCode == "403") {
									redirectFirstPageForError(message);
									return;
								}

								setInputError($("#inpCertCode"), message);
								setCertCodeBtnDisable("confirmBtn", false);
								$("#matchedCertCodeText").hide();

								isAuthenticated = false;
							}

							function setCertCodeBtnDisable(objId, disabled) {
								if (disabled) {
									$("#" + objId).addClass("disabled");
								} else {
									$("#" + objId).removeClass("disabled");
								}
							}

							function setAuthenticatedStatus(authValue, code) {
								offPlaceHolder($("#inpPhone"));
								offPlaceHolder($("#inpCertCode"));

								$("#inpPhone").val(authValue);
								sendCertCodeOK();
								setCertCodeBtnDisable("certBtn", false);

								$("#inpCertCode").val(code);
								confirmCertCodeOK();
							}

							function showErrorBox(input) {
								$(input).parent().addClass("info_error")
										.removeClass("wrap_valid").removeClass(
												"wrap_typing");
							}

							function showErrorMessage(input, message) {
								if (message !== undefined && message != "") {
									$(input).parent().siblings(".txt_message")
											.html(message).show();
								}
							}

							function hideErrorMessage(input) {
								$(input).parent().siblings(".txt_message")
										.hide();
							}

							function resetBox(input) {
								$(input).parent().removeClass("info_error")
										.removeClass("wrap_valid").removeClass(
												"wrap_typing");
							}

							function hideTypingBox(input) {
								$(input).parent().removeClass("info_error")
										.removeClass("wrap_typing");
							}

							function showTypingBox(input) {
								$(input).parent().removeClass("info_error")
										.addClass("wrap_valid").addClass(
												"wrap_typing");
							}

							function showTypingBoxForAuth(input) {
								$(input).parent().removeClass("info_error")
										.addClass("wrap_typing");
							}

							function showSuccessBox(input) {
								$(input).parent().removeClass("info_error")
										.addClass("wrap_valid").removeClass(
												"wrap_typing");
							}

							function existErrorMessage(input) {
								return $(input).parent().siblings(
										".txt_message").length > 0;
							}

							function getProperErrorMessageTarget(input) {
								var target;
								var id = $(input).attr("id");
								if ("inpPhone" == id) {
									target = $("#inpCertCode");
								} else if ("password1" == id) {
									target = $("#password2");
								} else {
									target = input;
								}
								return target;
							}

							$(".link_back").click(function() {
								var prev = "https://member.daum.net/join/terms"
								if ("" != "") {
									prev = prev + "?rtnUrl=";
								}
								location.href = prev;
							});

							initAutoComplete($("#countryListContainer"),
									$("#mobileNational"),
									$("#mobileNationalCode"));
						});

		function redirectFirstPageForError(message) {
			alert(message);
			location.href = "https://member.daum.net/join/terms";
		}
