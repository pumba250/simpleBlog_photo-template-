<?php include __DIR__ . '/header.tpl'; 
if (isset($_GET['id'])) {
    $newsId = (int)$_GET['id'];
    $newsItem = $news->getNewsById($newsId);
    $commentsList = $comments->getComments($newsId);

    if ($newsItem):
?>
<div class="w3-card-4 w3-margin w3-white">
    <div class="w3-container w3-padding-16">
        <h3><b><?= htmlspecialchars($newsItem['title']) ?></b>
            <?php if (isset($user) && $user['isadmin'] == 9): ?>
                <span class="w3-right">
                    <a href="/admin/edit_news.php?id=<?= $newsItem['id'] ?>" class="w3-button w3-small w3-light-grey">Редактировать</a>
                    <a href="/admin/delete_news.php?id=<?= $newsItem['id'] ?>" class="w3-button w3-small w3-light-grey">Удалить</a>
                </span>
            <?php endif; ?>
        </h3>
        <h5 class="w3-opacity"><?= date('d.m.Y', strtotime($newsItem['created_at'])) ?></h5>
    </div>
    <div class="w3-container">
        <p><?= nl2br(htmlspecialchars($newsItem['content'])) ?></p>
        <div class="w3-row w3-margin-top">
            <div class="w3-col m8 s12">
                <a href="/" class="w3-button w3-padding-large w3-light-grey w3-border">
                    <b>Вернуться на главную</b>
                </a>
            </div>
        </div>
    </div>
</div>

<!-- Комментарии -->
<div class="w3-card-4 w3-margin w3-white">
    <div class="w3-container w3-padding-16">
        <h4><b>Комментарии</b></h4>
        <?php if (empty($commentsList)): ?>
            <p>Пока нет комментариев. Будьте первым!</p>
        <?php else: ?>
            <?php foreach ($commentsList as $comment): ?>
                <div class="w3-panel w3-leftbar w3-light-grey w3-padding">
                    <p><strong><?= htmlspecialchars($comment['user_name']) ?></strong> · <small><?= date('d.m.Y H:i', strtotime($comment['created_at'])) ?></small></p>
                    <p><?= htmlspecialchars($comment['user_text']) ?></p>
                </div>
            <?php endforeach; ?>
        <?php endif; ?>
        
        <form method="post" class="w3-margin-top">
            <?php if (!isset($user['username'])): ?>
                <input class="w3-input w3-border w3-padding" type="text" name="user_name" required placeholder="Ваше имя">
            <?php endif; ?>
            <textarea class="w3-input w3-border w3-padding" style="height:100px; margin-top:10px" name="user_text" required placeholder="Ваш комментарий"></textarea>
            <button type="submit" class="w3-button w3-light-grey w3-padding-large w3-margin-top">
                Отправить комментарий
            </button>
        </form>
    </div>
</div>
<?php
    else:
        header('HTTP/1.1 404 Not Found');
        include __DIR__ . '/404.tpl';
    endif;
} else {
    if ($news):
        foreach ($news as $newsItem):
?>
<div class="w3-card-4 w3-margin w3-white">
    <div class="w3-container w3-padding-16">
        <h3><b><?= htmlspecialchars($newsItem['title']) ?></b>
            <?php if (isset($user) && $user['isadmin'] == 9): ?>
                <span class="w3-right">
                    <a href="/admin/edit_news.php?id=<?= $newsItem['id'] ?>" class="w3-button w3-small w3-light-grey">Редактировать</a>
                    <a href="/admin/delete_news.php?id=<?= $newsItem['id'] ?>" class="w3-button w3-small w3-light-grey">Удалить</a>
                </span>
            <?php endif; ?>
        </h3>
        <h5 class="w3-opacity"><?= date('d.m.Y', strtotime($newsItem['created_at'])) ?></h5>
    </div>
    <div class="w3-container">
        <p><?= nl2br(htmlspecialchars(mb_substr($newsItem['content'], 0, 200) . '...')) ?></p>
        <div class="w3-row">
            <div class="w3-col m8 s12">
                <a href="?id=<?= $newsItem['id'] ?>" class="w3-button w3-padding-large w3-light-grey w3-border">
                    <b>Читать далее »</b>
                </a>
            </div>
        </div>
    </div>
</div>
<?php
        endforeach; 
    else:
        echo '<div class="w3-card-4 w3-margin w3-white w3-padding-16"><p>Пока нет записей в блоге.</p></div>';
    endif; 
}
include __DIR__ . '/footer.tpl';