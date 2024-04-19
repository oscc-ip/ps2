## Datasheet

### Overview
The `ps2` IP is a fully parameterised soft IP implementing the IBM compatible PS/2 interface. The IP features an APB4 slave interface, fully compliant with the AMBA APB Protocol Specification v2.0. Now only support keyboard.

### Feature
* Support PS/2 keyboard only
* Configurable receive fifo depth
* Maskable fifo no-empty interrupt
* Static synchronous design
* Full synthesizable

### Interface
| port name | type        | description          |
|:--------- |:------------|:---------------------|
| apb4 | interface | apb4 slave interface |
| ps2 ->| interface | ps2 slave interface |
| `ps2.ps2_clk_i` | input | ps2 clock input |
| `ps2.ps2_dat_i` | input | ps2 data input |
| `ps2.irq_o` | output | ps2 interrupt output |

### Register

| name | offset  | length | description |
|:----:|:-------:|:-----: | :---------: |
| [CTRL](#control-register) | 0x0 | 4 | control register |
| [DATA](#data-register) | 0x4 | 4 | data register |
| [STAT](#state-register) | 0x8 | 4 | state register |

#### Control Register
| bit | access  | description |
|:---:|:-------:| :---------: |
| `[31:2]` | none | reserved |
| `[1:1]` | RW | EN |
| `[0:0]` | RW | ITN |

reset value: `0x0000_0000`

* EN:
* ITN:


#### Data Register
| bit | access  | description |
|:---:|:-------:| :---------: |
| `[31:8]` | RO | MTIMEL |

reset value: `0x0000_0000`

* MTIMEL: the low 32-bit of 64-bit `mtime` CSR register

#### State Register
| bit | access  | description |
|:---:|:-------:| :---------: |
| `[31:0]` | RO | MTIMEH |

reset value: `0x0000_0000`

* MTIMEH: the high 32-bit of 64-bit `mtime` CSR register

### Program Guide
The software operation of `ps2` is simple. These registers can be accessed by 4-byte aligned read and write. the C-like pseudocode of the timer interrupt operation:
```c
ps2.MTIMECMPL = MTIMECMP_LOW_32_bit  // write low 32-bit mtimecmp register
ps2.MTIMECMPH = MTIMECMP_HIGH_32_bit // write high 32-bit mtimecmp register
... // some codes

// === mtime interrupt handle start ===
// add new value to the mtime interrupt
ps2.MTIMECMPL = UPDATE_DELTA_VALUE & 0x0000FFFF
ps2.MTIMECMPH = UPDATE_DELTA_VALUE & 0xFFFF0000
// === mtime interrupt handle end ===

... // some codes

```
software interrupt operation:
```c
ps2.MSIP = 1 // trigger software interrupt
... // some codes

// === software interrupt handle start ===
ps2.MSIP = 0 // clear the software interrupt
// === software interrupt handle end ===

... // some codes

```

### Resoureces
### References
### Revision History