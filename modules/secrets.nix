{
  age.identityPaths = [ "/home/timl/.ssh/id_ed25519" ];
  age.secrets.resticPassword = {
    file = ../secrets/restic/password.age;
    owner = "timl";
    group = "users";
  };
  age.secrets.backblazeB2ResticS3EnvironmentSecrets = {
    file = ../secrets/restic/env.age;
    owner = "timl";
    group = "users";
  };
  age.secrets.wireguardPrivateKey = {
    file = ../secrets/wireguard/wireguardPrivateKey.age;
    owner = "timl";
    group = "users";
  };
  age.secrets.wireguardPresharedKey = {
    file = ../secrets/wireguard/wireguardPreshardKey.age;
    owner = "timl";
    group = "users";
  };
}
