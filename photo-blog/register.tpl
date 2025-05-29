<?php include __DIR__ . '/header.tpl'; ?>
<div class="w3-card-4 w3-margin w3-white">
    <div class="w3-container w3-padding-32">
        <?php if (!$user): ?>
            <h2 class="w3-center">Регистрация</h2>
            <p class="w3-center w3-opacity">Создайте учетную запись автора</p>
            
            <?php flash(); ?>
            
            <form method="POST" class="w3-container">
                <input type="hidden" name="action" value="register">
                
                <div class="w3-section">
                    <label>Логин</label>
                    <input class="w3-input w3-border" type="text" name="username" required>
                </div>
                
                <div class="w3-section">
                    <label>Пароль</label>
                    <input class="w3-input w3-border" type="password" name="password" required>
                </div>
                
                <div class="w3-section">
                    <label>Email</label>
                    <input class="w3-input w3-border" type="email" name="email" required>
                </div>

                <!-- Добавленная капча -->
                <div class="w3-section">
                    <label>Код безопасности</label>
                    <div class="w3-row">
                        <div class="w3-col s8">
                            <input class="w3-input w3-border" type="text" name="captcha" required placeholder="Введите код">
                        </div>
                        <div class="w3-col s4">
                            <img src="<?= $captcha_image_url ?>" alt="CAPTCHA" class="w3-image" style="height:38px">
                        </div>
                    </div>
                </div>
                
                <div class="w3-section w3-center">
                    <button type="submit" class="w3-button w3-light-grey w3-padding-large">
                        Зарегистрироваться
                    </button>
                </div>
            </form>
        <?php else: ?>
            <div class="w3-panel w3-green w3-round">
                <p class="w3-center">Вы уже авторизованы как <?= htmlspecialchars($user['username']) ?></p>
                <p class="w3-center"><a href="/" class="w3-button w3-light-grey">На главную</a></p>
            </div>
        <?php endif; ?>
    </div>
</div>
<?php include __DIR__ . '/footer.tpl'; ?>