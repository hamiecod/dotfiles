function t ()
	printf %"$COLUMNS"s |tr " " "-"
	set text "No TODO for today! :)"
	cat TODO 2>/dev/null || echo $text
	printf %"$COLUMNS"s |tr " " "-"
end
