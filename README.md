# Rin's Home 🏚

> This "README" is available in 🇮🇩 [**Bahasa**](./BACALAH.md).

## Motivation

(DRY) - Don't repeat yourself is a principle in software development. We should use this principle to reduce repetitive and time-consuming work. Personally, I just try to apply this principle in my professional and personal work. The most basic example is making these dotfiles, so that I don't have to provide the needs of the devices or tools used in everyday life. So, from this motivation you can see the main goal (Goal).

The work of a software developer, software engineer, or software laborer requires tools that are used on top of a running system (termed an operating system or OS). I am familiar with using operating systems such as OSX based on Darwin/Unix made by Apple and ArchLinux based on Linux. Well my goal is to become a human user agnostic (not religiously attached to a system but still loyal to the creator of the user, except for the operating system made by Mikocok). The tools are collected in one place to store everything about tools, configurations, settings, credentials, and others that support the needs of working or just operating a computer. Where is my container? In this github, then we need git or other tools, which is clear that we stay in sync between each machine we use so that we don't do repetitive things.

To keep it pure and the same between each machine, I decided to use Nix.

## Nix

Nix is a "purely functional package manager", the Nix experience is completely different than other package managers. For some people it may seem complicated to use, but it is worth it if you understood what you really need.

If you have ever used the "virtual env" tool popular in the "python" ecosystem then you can experience the same thing but across operating systems, platforms, and programming language ecosystems.

Since nix uses functional concepts like declarative then it should be utilized well. such as declaring needs and then declaring with nix language.

<hr/>

> Heavily inspired from ([malob/nixpkgs](https://github.com/malob/nixpkgs)).

This is my personal configuration with [nix](https://nixos.org/) using [**flakes**](https://nixos.wiki/wiki/Flakes), [**home-manager**](https://github.com/nix-community/home-manager), & [**nix-darwin**](https://github.com/LnL7/nix-darwin) for Darwin or MacOS System.

## Structure

```console
.
├── darwin.nix (Nix Darwin configuration)
├── default.nix (Support legacy nix)
├── flake.lock
├── flake.nix (Flake configuration)
├── flake.nix.simple (Example: currently NOT USED)
├── home (home-manager)
│   ├── activation.nix (Some script and configuration when activation the home manager)
│   ├── packages.nix (list packages per user)
│   └── shells.nix (shell configuration, default Fish shell with startship)
├── nixpkgs.nix (Support legacy nix)
├── pkgs (modules for overlay in flake.nix, mostly generated by related tools like node2nix)
│   └── node-packages
│       ├── README.md
│       ├── default.nix
│       ├── node-env.nix
│       ├── node-packages.json
│       └── node-packages.nix
└── result -> /nix/store/xxxxxxx (the result when completed run nix build)

4 directories, 15 files

```

## Usage

### Prerequisite

#### **Nix**

| System                                         | Single User | Multiple User | Command                                                             |
| ---------------------------------------------- | ----------- | ------------- | ------------------------------------------------------------------- |
| **Linux**                                      | ✅          | ✅            | [Single User](#linux-single-user) • [Multi User](#linux-multi-user) |
| **Darwin** (MacOS)                             | ❌          | ✅            | [Multi User](#darwin-multi-user)                                    |
| [**More...**](https://nixos.org/download.html) |             |               |                                                                     |

##### Linux Single User

```console
sh <(curl -L https://nixos.org/nix/install) --daemon
```

##### Linux Multi User

```console
sh <(curl -L https://nixos.org/nix/install) --no-daemon
```

##### Darwin Multi User

```console
sh <(curl -L https://nixos.org/nix/install)
```

#### Enable `experimental-features`

In general installation of nix, the nix configuration is located in `~/.config/nix/nix.conf`.
You **MUST** be set the `experimental-features` before use [this configuration](https://github.com/r17x/nixpkgs).

```cfg
experimental-features = nix-command flakes

// (optional) for distribution cache (DON'T COPY THIS COMMENT LINE)
substituters = https://cache.nixos.org https://cache.nixos.org/ https://r17.cachix.org
```

### Setup

- Clone [this repository](https://github.com/r17x/nixpkgs)

```console
// with SSH

git clone git@github.com:r17x/nixpkgs ~/.config/nixpkgs

// OR with HTTP
git clone https://github.com/r17x/nixpkgs ~/.config/nixpkgs

```

- Change directory to `~/.config/nixpkgs`

```console
cd ~/.config/nixpkgs
```

- Run Build  
  command for build: `nix build .#darwinConfigurations.[NAME].system`  
  Available for `[NAME]`:
  - `RG`

```console
nix build .#darwinConfigurations.RG.system
```

- Apply from `Result`  
  command for apply the result: `./result/sw/bin/darwin-rebuild switch --flake .#[NAME]`  
  Available for `[NAME]`:
  - `RG`  
    After `Run Build` you can apply from `./result` with this command

```console
./result/sw/bin/darwin-rebuild switch --flake .#RG
```

- Done 🚀🎉

## Command List

* `drb` - darwin rebuild aliases - rebuild this nixpkgs.
* `drs` - darwin rebuild and switch the build version (make current build to current version of environment).
* `lenv` - list of build version `<VERSION>`, that's usefull for switch aka rollback environment.
* `senv <VERSION>` - switch spesific version (number).

## Acknowledgement

- [**malob/nixpkgs**](https://github.com/malob/nixpkgs) ~ [malob](https://github.com/malob) Nix System configs!.
