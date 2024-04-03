#!/bin/bash
# Визначення масиву з URL вебсайтів для перевірки
websites=("https://google.com" "https://facebook.com" "https://twitter.com")
# Визначення файлу логів
logfile="website_status.log"
# Очищення файлу логів перед виконанням
> "$logfile"
# Перевірка кожного сайту
for site in "${websites[@]}"
do    # Використання команди curl для перевірки доступності веб-сайту
    if curl -s -L --head --request GET -w "%{http_code}\n" "$site" | grep "200" > /dev/null
    then
        echo "$site is UP" >> "$logfile"
    else
        echo "$site is DOWN" >> "$logfile"
    fi
done

echo "Результати перевірки збережено у файлі логів $logfile"
