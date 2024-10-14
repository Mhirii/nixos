{
  programs.chromium = {
    enable = true;
    extensions = [
      {id = "fmkadmapgofadopljbjfkapdkoienihi";} # React Developer Tools
      {id = "pgamkpjkbfldnmemhcbekimfdnjcgkco";} # Tailwind CSS Devtools
      {id = "fcombecpigkkfcbfaeikoeegkmkjfbfm";} # React Performance Devtool
      {id = "lmhkpmbekcpmknklioeibfkpmmfibljd";} # Redux DevTools
    ];
  };
}
