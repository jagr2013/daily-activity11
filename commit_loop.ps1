# =========================
# НАСТРОЙКИ
# =========================
$RepoDir = "C:\Users\Vadim\Desktop\daily-activity11"  # Путь к папке репозитория
$File = "activity.txt"  # Файл для изменений
$Branch = "main"  # Ветка
$NumCommits = 10  # Количество коммитов (изменяй здесь)
$DelaySeconds = 10  # Задержка между коммитами

Set-Location $RepoDir

Write-Host "Commit loop started. Will make $NumCommits commits. Press Ctrl+C to stop." -ForegroundColor Green

# =========================
# ЦИКЛ НА ФИКСИРОВАННОЕ КОЛИЧЕСТВО КОММИТОВ
# =========================
for ($i = 1; $i -le $NumCommits; $i++) {

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    # Реальное изменение файла
    Add-Content $File "Update at $timestamp"

    # Коммит
    git add $File
    git commit -m "activity update $timestamp"

    # Push
    git push origin $Branch

    Write-Host "Committed $i/$NumCommits at $timestamp" -ForegroundColor Cyan

    if ($i -lt $NumCommits) {
        Start-Sleep -Seconds $DelaySeconds
    }
}

Write-Host "Completed $NumCommits commits. Script finished." -ForegroundColor Green