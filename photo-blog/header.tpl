<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title><?= htmlspecialchars($pageTitle ?? 'Фотоблог') ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Персональный фотоблог">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;600&family=Playfair+Display:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            color: #333;
            line-height: 1.6;
            background-color: #f9f9f9;
        }
        h1, h2, h3, h4, h5 {
            font-family: 'Playfair Display', serif;
            font-weight: 600;
        }
        .w3-white {
            background-color: #fff !important;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .w3-button:hover {
            background-color: #f1f1f1 !important;
        }
		/* Стили для капчи */
		.captcha-container {
			display: flex;
			align-items: center;
			margin-bottom: 15px;
		}
		.captcha-image {
			margin-left: 10px;
			border: 1px solid #ddd;
			border-radius: 4px;
		}
		.captcha-input {
			flex-grow: 1;
		}
        .post-image {
            width: 100%;
            height: 300px;
            object-fit: cover;
            transition: transform 0.3s;
        }
        .post-image:hover {
            transform: scale(1.02);
        }
        .tag {
            display: inline-block;
            padding: 3px 8px;
            background-color: #f5f5f5;
            border-radius: 3px;
            margin: 2px;
            font-size: 0.8em;
        }
        @media (max-width: 600px) {
            .post-image {
                height: 200px;
            }
        }
    </style>
</head>
<body>
<div class="w3-content" style="max-width:1200px">
<header class="w3-container w3-center w3-padding-32">
    <h1 style="letter-spacing: 3px;"><b>ФОТОБЛОГ</b></h1>
    <p>Заметки и впечатления в фотографиях</p>
</header>
<div class="w3-row">
<div class="w3-col l8 s12">