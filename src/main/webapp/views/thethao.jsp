<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bài báo về Diễn viên "Con nhà nòi"</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            background-color: #f4f4f4;
            color: #333;
        }

        header {
            background-color: #fff;
            padding: 20px;
            border-bottom: 2px solid #e5e5e5;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .menu {
            display: flex;
            justify-content: space-between;
            width: 100%;
            overflow-y: auto;
        }

        .menu ul {
            display: flex;
            justify-content: space-around;
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        .menu ul li {
            margin: 0 10px;
            padding: 10px;
        }

        .menu ul li a {
            text-decoration: none;
            font-size: 20px;
            color: black;
        }

        .menu ul li a:hover {
            color: red;
        }

        h1 {
            text-align: center;
            font-size: 2.5rem;
            color: #333;
            margin-bottom: 20px;
        }

        .article {
            padding: 20px;
            background-color: #fff;
            margin-bottom: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .article img {
            display: block;
            margin: 20px auto;
            max-width: 100%;
            height: auto;
            border-radius: 5px;
        }

        .article p {
            margin-bottom: 15px;
            font-size: 1rem;
            color: #555;
            line-height: 1.8;
            text-align: justify;
        }

        @media (max-width: 768px) {
            h1 {
                font-size: 2rem;
            }

            .menu ul {
                flex-direction: column;
                align-items: center;
            }

            .menu ul li {
                margin-bottom: 10px;
            }
        }
    </style>
</head>

<body>
    <header>
        <div class="container">
            
            <div class="menu">
                <ul>
                    <li><a href="#">Trang Chủ</a></li>
                    <li><a href="#">Văn Hóa</a></li>
                    <li><a href="#">Pháp Luật</a></li>
                    <li><a href="#">Thể Thao</a></li>
                </ul>
            </div>
        </div>
    </header>

    <div class="container">
        <div class="article">
            <h1>M.U - Tottenham: Quyết định chiếc ghế HLV Erik ten Hag</h1>
            <h3>Trận đấu giữa M.U gặp Tottenham lúc 22 giờ 30 ngày 29.9 (giờ VN) trên sân Old Trafford sẽ mang tính quyết định số phận chiếc ghế đang lung lay của HLV Erik ten Hag, theo kênh Sky Sports (Anh).</h3>
            
            <!-- Hình ảnh chèn vào giữa -->
            <!-- <img src="./assets/img/vanhoa2.jpg" alt="Diễn viên trẻ nổi bật trong văn hóa"> -->
             <br>

            <p>"Tôi không nghĩ là HLV Ange Postecoglou của Tottenham chịu áp lực. Theo quan điểm của tôi, HLV Erik ten Hag của M.U mới là người đang chịu sức ép cực lớn. Đúng là cả Tottenham và M.U đều chưa đạt kết quả như kỳ vọng sau 5 vòng đầu mùa giải, nhưng M.U mới là đội kém cỏi hơn so với lối chơi có phần sáng sủa của Tottenham. Một trận thua nữa tại Old Trafford, tôi nghĩ, chiếc ghế HLV của ông Erik ten Hag sẽ sụp đổ", cựu cầu thủ Paul Merson (Anh) bình luận trên kênh Sky Sports trước trận đấu.</p>

            <!-- Hình ảnh chèn vào giữa -->
            <img src="./assets/img/vanhoa9.jpg" alt="Long Vũ trong vai chính">

            <p>M.U và Tottenham đều có 7 điểm sau 5 vòng đấu giải Ngoại hạng Anh, cùng có 2 thắng, 1 hòa và 2 thua. Spurs tạm xếp trên (vị trí thứ 10) 
                nhờ có hiệu số tốt hơn "Quỷ đỏ": +4 so với 0. Hàng tấn công chính là vấn đề lớn của M.U, dù họ đang sở hữu nhiều cầu thủ chất lượng, 
                nhưng lại có hiệu suất ghi bàn rất kém. Ngoài trận thắng đội hạng 3 nước Anh là Barnsley với tỷ số đến 7-0 tại vòng 3 Cúp Liên đoàn
                 ở các trận còn lại tại các đấu trường quan trọng như Ngoại hạng Anh và Europa League mới đây (hòa Twente 1-1), M.U là đội nằm trong tốp đầu 
                 các đội bỏ lỡ cơ hội ghi bàn nhiều nhất trong 5 giải VĐQG hàng đầu châu Âu.</p>

            <!-- Hình ảnh chèn vào giữa -->
            <!-- <img src="./assets/img/vanhoa7.jpg" alt="Võ Hoài Anh trong Hoa sữa về trong gió"> -->

            <p> "Vậy cho đến nay, M.U đã làm gì sai?", báo chí Anh đặt câu hỏi. HLV Erik ten Hag thừa nhận: "Chúng tôi cần phải ghi nhiều bàn thắng hơn". <br>
                M.U đang có đội hình tốt nhất của họ, trừ Leny Yoro, Lindelof và Luke Shaw vẫn dưỡng thương. Ông Erik ten Hag có thể sẽ đưa tiền vệ Kobbie Mainoo trở lại đội hình chính, sau khi tân binh Manuel Ugarte chưa thể hiện được như kỳ vọng. Tương tự là Garnacho, trong khi Rashford và Amad Diallo chưa rõ có thể chiếm vị trí chính thức hay không. Phía Tottenham, chỉ có một lo lắng là đội trưởng Son Heung-min bị đau nhẹ, đang chờ kiểm tra đến phút chót về khả năng thi đấu.
                </p>

            <!-- Hình ảnh chèn vào giữa -->
            <!-- <img src="./assets/img/vanhoa8.jpg" alt="Gia đình Võ Hoài Nam và con trai"> -->

            <p>Ngoài trận đại chiến M.U - Tottenham, trận còn lại vòng 6 giải Ngoại hạng Anh diễn ra giữa Ipswich gặp Aston Villa lúc 20 giờ ngày 29.9. Trận muộn nhất giữa Bournemouth gặp Southampton diễn ra lúc 2 giờ ngày 1.10.</p>

            <!-- Hình ảnh chèn vào giữa -->
            <!-- <img src="./assets/img/actor4.jpg" alt="Bùi Thạc Phong trong phim Mưa trên cánh bướm">

            <p>Diễn viên Gia Bảo, con trai của NSND Công Lý và MC Thảo Vân, cũng đang bước những bước đầu tiên trong sự nghiệp diễn xuất. Gia Bảo bắt đầu bằng vai nhỏ trong "Sao Kim bắn tim Sao Hỏa" và tiếp tục rèn luyện qua từng vai diễn.</p> -->
        </div>
    </div>
</body>

</html>
