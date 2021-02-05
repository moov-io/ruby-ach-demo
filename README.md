## moov-io/ruby-ach-demo

[![Build Status](https://travis-ci.com/moov-io/ruby-ach-demo.svg?branch=master)](https://travis-ci.com/moov-io/ruby-ach-demo)
[![Apache 2 licensed](https://img.shields.io/badge/license-Apache2-blue.svg)](https://raw.githubusercontent.com/moov-io/ruby-ach-demo/master/LICENSE)

Welcome to Moov's Ruby guide to using our Automated Clearing House (ACH) library and HTTP service! ACH is used to transfer trillions of dollars annually in the United States of America. The underlying format sends plaintext files between Financial Insitutions and the [United States FED](https://www.frbservices.org/financial-services/ach/index.html).

Example usecases of ACH:

- Direct Deposit from your employer, government benefits (Social Security)
- Paying a friend via apps (P2P payments)
- Stock / Retirement investments or withdrawls

We offer documentation on [how ACH works](https://moov-io.github.io/ach/intro) and Gusto has an excellent four part series on "[How ACH works: A developer perspective](https://engineering.gusto.com/how-ach-works-a-developer-perspective-part-1/)".

### Getting Started

You can pull down our example project and run it locally. The demo source code is in `main.rb`.

```
$ git clone https://github.com/moov-io/ruby-ach-demo

$ cd ruby-ach-demo

$ make && make run
...
Moov ACH Ruby Demo (version v0.1.0-dev)
File ea990a921f240eb71f29d80167a07755 created
File created successfully
File validated successfully
```

## Getting Help

 channel | info
 ------- | -------
 [Project Documentation](https://docs.moov.io/) | Our project documentation available online.
 Google Group [moov-users](https://groups.google.com/forum/#!forum/moov-users)| The Moov users Google group is for contributors other people contributing to the Moov project. You can join them without a google account by sending an email to [moov-users+subscribe@googlegroups.com](mailto:moov-users+subscribe@googlegroups.com). After receiving the join-request message, you can simply reply to that to confirm the subscription.
Twitter [@moov_io](https://twitter.com/moov_io)	| You can follow Moov.IO's Twitter feed to get updates on our project(s). You can also tweet us questions or just share blogs or stories.
[GitHub Issue](https://github.com/moov-io) | If you are able to reproduce a problem please open a GitHub Issue under the specific project that caused the error.
[moov-io slack](https://slack.moov.com/) | Join our slack channel to have an interactive discussion about the development of the project.

## Supported and Tested Platforms

- 64-bit Linux (Ubuntu, Debian), macOS, and Windows
- Rasberry Pi

Note: 32-bit platforms have known issues and are not supported.

## Contributing

Yes please! Please review our [Contributing guide](https://github.com/moov-io/ach/blob/master/CONTRIBUTING.md) and [Code of Conduct](https://github.com/moov-io/ach/blob/master/CODE_OF_CONDUCT.md) to get started!

This project uses [Go Modules](https://github.com/golang/go/wiki/Modules) and uses Go 1.14 or higher. See [Golang's install instructions](https://golang.org/doc/install) for help setting up Go.

## License

Apache License 2.0 See [LICENSE](LICENSE) for details.
