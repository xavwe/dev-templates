{
  description = "Multi-language Nix flake templates";

  outputs = { self }: {
    templates = {
      bash = {
        path = ./bash;
        description = "Lua development environment";
      };
      cpp = {
        path = ./cpp;
        description = "C++ development environment";
      };
      python = {
        path = ./python;
        description = "Python development environment";
      };
      groff = {
        path = ./groff;
        description = "Groff development environment";
      };
      latex = {
        path = ./latex;
        description = "LaTeX development environment";
      };
      zig = {
        path = ./zig;
        description = "Zig development environment";
      };
      astro = {
        path = ./astro;
        description = "Astro development environment";
      };
    };
  };
}

