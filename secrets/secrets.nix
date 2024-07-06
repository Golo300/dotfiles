let
  timl = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOb9qR65i6UTSF92nnOYZZ3zxRyIxv9ApS702G01mabG";
in
{
  "restic/env.age".publicKeys = [ timl ];
  "restic/password.age".publicKeys = [ timl ];

  "wireguard/wireguardPrivateKey.age".publicKeys = [ timl ];
  "wireguard/wireguardPreshardKey.age".publicKeys = [ timl ];
}

