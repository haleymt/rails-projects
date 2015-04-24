module TracksHelper

  def ugly_lyrics(lyrics)
    html = ""
    lyrics.each_line do |line|
      html += "<center><div>&#9835; #{line}</div></center>"
    end
    html.html_safe
  end
end
