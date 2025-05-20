{
  os = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gwd20smyhxbm687vdikfh1gpi96h8qb1x28s2pdcysf6dm6v0ap";
      type = "gem";
    };
    version = "1.1.4";
  };
  seccomp-tools = {
    dependencies = ["os"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0v5zyby5glih0prddxm8wp6gn2glrnvf7y4r64k4iqfpdazdpsa3";
      type = "gem";
    };
    version = "1.6.1";
  };
}
