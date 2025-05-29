<?php include __DIR__ . '/header.tpl'; ?>
<div class="w3-card-4 w3-margin w3-white">
    <div class="w3-container w3-padding-32">
        <h2 class="w3-center">Свяжитесь с нами</h2>
        <p class="w3-center w3-opacity">Заполните форму ниже для отправки сообщения</p>
        
        <?php if (!empty($errors)): ?>
            <div class="w3-panel w3-pale-red w3-border w3-round">
                <?= htmlspecialchars(implode('<br>', $errors)) ?>
            </div>
        <?php endif; ?>
        
        <form method="POST" class="w3-container">
            <input type="hidden" name="action" value="contact">
            
            <div class="w3-section">
                <label>Ваше имя</label>
                <input class="w3-input w3-border" type="text" name="name" required>
            </div>
            
            <div class="w3-section">
                <label>Email</label>
                <input class="w3-input w3-border" type="email" name="email" required>
            </div>
            
            <div class="w3-section">
                <label>Сообщение</label>
                <textarea class="w3-input w3-border" style="height:150px" name="message" required></textarea>
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
                    Отправить сообщение
                </button>
            </div>
        </form>
    </div>
</div>
<?php include __DIR__ . '/footer.tpl'; ?>