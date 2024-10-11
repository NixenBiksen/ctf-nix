{
  python3,
  gdb,
  pwntoolsGdb ? gdb,
}:

python3.withPackages (
  ps: with ps; [
    angr
    claripy
    gmpy2
    ipython
    numpy
    pillow
    (pwntools.override { debugger = pwntoolsGdb; })
    pycryptodome
    requests
    scapy
    scipy
    seccomp
    tqdm
    z3
  ]
)
