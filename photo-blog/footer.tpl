</div>

<!-- Боковая панель -->
<div class="w3-col l4">
    <!-- О блоге -->
    <div class="w3-card w3-margin w3-margin-top">
        <div class="w3-container w3-white">
            <?php if ($user): ?>
                <div class="w3-padding-16">
                    <span class="w3-right">
                        <form method="post" action="/admin.php?logout">
                            <button type="submit" class="w3-button w3-light-grey">Выйти</button>
                        </form>
                    </span>
                    <h4>Привет, <?= htmlspecialchars($user['username']) ?>!</h4>
                    <?php if ($user['isadmin'] == '9'): ?>
                        <p><a href="/admin.php" class="w3-button w3-light-grey">Панель управления</a></p>
                    <?php endif; ?>
                </div>
            <?php else: ?>
                <div class="w3-padding-16">
                    <button onclick="document.getElementById('loginModal').style.display='block'" 
                            class="w3-button w3-light-grey w3-block">
                        Вход для авторов
                    </button>
                </div>

                <!-- Модальное окно входа -->
                <!-- В модальном окне входа (в footer.tpl) -->
<div id="loginModal" class="w3-modal">
    <div class="w3-modal-content" style="max-width:500px">
        <div class="w3-container">
            <span onclick="document.getElementById('loginModal').style.display='none'" 
                  class="w3-button w3-display-topright">&times;</span>
            <h3 class="w3-padding-16">Авторизация</h3>
            <form method="POST">
                <input type="hidden" name="action" value="login">
                
                <div class="w3-section">
                    <label><b>Логин</b></label>
                    <input class="w3-input w3-border w3-margin-bottom" type="text" name="username" required>
                </div>
                
                <div class="w3-section">
                    <label><b>Пароль</b></label>
                    <input class="w3-input w3-border" type="password" name="password" required>
                </div>

                <!-- Добавленная капча -->
                <div class="w3-section">
                    <label><b>Код безопасности</b></label>
                    <div class="w3-row">
                        <div class="w3-col s8">
                            <input class="w3-input w3-border" type="text" name="captcha" required placeholder="Введите код">
                        </div>
                        <div class="w3-col s4">
                            <img src="<?= $captcha_image_url ?>" alt="CAPTCHA" class="w3-image" style="height:38px">
                        </div>
                    </div>
                </div>
                
                <button class="w3-button w3-light-grey w3-block w3-margin-top" type="submit">Войти</button>
            </form>
            <p class="w3-center w3-padding-16">
                <a href="?action=register">Регистрация</a>
            </p>
        </div>
    </div>
</div>
            <?php endif; ?>
            <p><a href="/" class="w3-button w3-light-grey w3-block">Главная</a></p>
            <p><a href="?action=contact" class="w3-button w3-light-grey w3-block">Контакты</a></p>
        </div>
    </div>
    <hr>
  
    <!-- Последние посты -->
    <div class="w3-card w3-margin">
        <div class="w3-container w3-padding">
            <h4>Последние записи</h4>
        </div>
        <ul class="w3-ul w3-hoverable w3-white">
            <?php if ($lastThreeNews): ?>
                <?php foreach ($lastThreeNews as $newsItem): ?>
                    <li class="w3-padding-16">
                        <a href="?id=<?= $newsItem['id'] ?>" class="w3-hover-text-blue">
                            <b><?= htmlspecialchars($newsItem['title']) ?></b><br>
                            <small><?= date('d.m.Y', strtotime($newsItem['created_at'])) ?></small>
                        </a>
                    </li>
                <?php endforeach; ?>
            <?php else: ?>
                <li class="w3-padding-16">Нет записей</li>
            <?php endif; ?>
        </ul>
    </div>
    <hr>
  
    <!-- Теги -->
    <div class="w3-card w3-margin">
        <div class="w3-container w3-padding">
            <h4>Теги</h4>
        </div>
        <div class="w3-container w3-white">
            <p>
                <?php if ($allTags): ?>
                    <?php foreach ($allTags as $tag): ?>
                        <a href="?tags=<?= urlencode($tag['name']) ?>" class="tag w3-hover-light-grey">
                            <?= htmlspecialchars($tag['name']) ?>
                        </a>
                    <?php endforeach; ?>
                <?php else: ?>
                    <span class="tag">Нет тегов</span>
                <?php endif; ?>
            </p>
        </div>
    </div>
</div>

<!-- Закрытие основной сетки -->
</div><br>

<!-- Пагинация -->
<div class="w3-center">
    <div class="w3-bar w3-border w3-round">
        <?php if ($currentPage > 1): ?>
            <a href="?page=<?= $currentPage - 1 ?>" class="w3-bar-item w3-button">&laquo;</a>
        <?php endif; ?>
        
        <?php for ($i = 1; $i <= $totalPages; $i++): ?>
            <a href="?page=<?= $i ?>" class="w3-bar-item w3-button <?= $i == $currentPage ? 'w3-blue' : '' ?>"><?= $i ?></a>
        <?php endfor; ?>
        
        <?php if ($currentPage < $totalPages): ?>
            <a href="?page=<?= $currentPage + 1 ?>" class="w3-bar-item w3-button">&raquo;</a>
        <?php endif; ?>
    </div>
</div>

<!-- Подвал -->
<footer class="w3-container w3-padding-32 w3-light-grey w3-center w3-margin-top">
    <p>&copy; <?= date("Y") ?> <?= htmlspecialchars($_SERVER['SERVER_NAME']) ?>. Powered by <?= $powered ?>_<?= $version ?>. Все права защищены.</p>
</footer>

<script>
// Закрытие модального окна при клике вне его
window.onclick = function(event) {
    if (event.target == document.getElementById('loginModal')) {
        document.getElementById('loginModal').style.display = "none";
    }
}
</script>
</body>
</html>
