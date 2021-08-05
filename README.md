# README

Rack
----

Run `rake middleware` to see all rack filters.

Option for adding a new filter:
```
• config.middleware.insert_after(existing_middleware, new_middleware, args)—Adds the new middleware after the specified existing middleware in the middleware stack.

• config.middleware.insert_before(existing_middleware, new_middleware, args)—Adds the new middleware before the specified existing middleware in the middleware stack.

• config.middleware.delete(middleware)—Removes a specified middleware from the stack.

• config.middleware.swap(existing_middleware, new_middleware, args)—Swaps a specified middleware from the stack with a new class.

• config.middleware.use(new_middleware, args)—Takes a class reference as its parameter and just adds the desired middleware to the end of the middleware stack.
```

Make a request manually from Rails console:

```
>> env = {}
>> env['REMOTE_ADDR'] = '127.0.0.1'
>> env['REQUEST_METHOD'] = 'GET'
>> env['PATH_INFO'] = '/products/1'
>> env['rack.input'] = StringIO.new
>> rack_body_proxy = R5kitchensink::Application.call(env).last
>> rack_body_proxy.last
```

Format response as YAML:

```
>> y R5kitchensink::Application.call(env)
```

Misc
----

[Include custom helper for using in console mode](https://github.com/cone/r5kitchensink/commit/11ea4cb1127325ba69ad63124b2cf754deebe8a5)

[Redirecting console output to STDOUT](https://github.com/cone/r5kitchensink/commit/59ac384a081139ccfcc64dad18a97ea9f1b75318)

Routing and resources
----

[Simple routing examples](https://github.com/cone/r5kitchensink/commit/834021a59d6b7e20343004d3045f0404675d61bd)

[Simple resource creation for CRUD operations](https://github.com/cone/r5kitchensink/commit/479c8e1f0eabb0e821249b751978a4ed342042ce)

[Adding nested resources example](https://github.com/cone/r5kitchensink/commit/83185b363611927476a0e4484f039c73c607a251)

[Example of route resource concerns](https://github.com/cone/r5kitchensink/commit/3000b955d27629f8080ba4f0b928843fe9ab4422)

[Add route customization example](https://github.com/cone/r5kitchensink/commit/4949e3a9fb5caa223e1e5eca852393c81a5bdd59)

[Add collection routes example](https://github.com/cone/r5kitchensink/commit/fd89059784aa196302d7166c014d0535dae5520b)

[Custom action names example](https://github.com/cone/r5kitchensink/commit/46bdb8aeac381881b5fa3afb5e06f4fa87ff9ff4)

[Map to a different controller example](https://github.com/cone/r5kitchensink/commit/956cf2ee43e94afa89e5f2fd5131ee819b5d8aba)

[Routes for new resources example](https://github.com/cone/r5kitchensink/commit/209e639644890bcd413aab81b550e66022438d72)

[Respond to a specific format and show link with an extension](https://github.com/cone/r5kitchensink/commit/410276d618d46e889715e917831e9c86dd535bcb)

Controllers
----

[Example of redirecting from controller](https://github.com/cone/r5kitchensink/commit/5a0663c9cab6cac20156e4582d68d41e406f5a66)
[More redirecting options](https://github.com/cone/r5kitchensink/commit/7efd9e45c0e4b2bad1c87e48f35197f67913e71a)

[Example of rendering another template](https://github.com/cone/r5kitchensink/commit/edb2ef48a3bbab556588a6e9e8e83bdb7ef43b1a)

[Example of rendering partials](https://github.com/cone/r5kitchensink/commit/8c25a0c6e697cb557828d33a95cbb4e96e580159)

[Example of rendering html](https://github.com/cone/r5kitchensink/commit/2066282978dced224f4f5860381c5bf3134d0401)

[Example of rendering inline template code](https://github.com/cone/r5kitchensink/commit/598a315b8807c789362c3602d2237074fe60dac5)

[Example of rendering plain and using a helper](https://github.com/cone/r5kitchensink/commit/73a1ff186522e415d24553775440d846748f003b)

[Example of rendering Javascript](https://github.com/cone/r5kitchensink/commit/ed1fc7c76b0d9010ab35f22c0bed272490772aca)

[Example of rendering options](https://github.com/cone/r5kitchensink/commit/5d3feabdbf013d8ad9f6ed929e199adf81bb1706)

[More rendering options](https://github.com/cone/r5kitchensink/commit/4a2e035032133a7f6eade1ea36be5330d585111a)

[Example of rendering nothing](https://github.com/cone/r5kitchensink/commit/a6c5af4faed07b846f588f0583cc845ae85cd842)

[Example of changing the layout](https://github.com/cone/r5kitchensink/commit/31b55d656192323be568221dc16a329410f77816)

[Example of redirecting back](https://github.com/cone/r5kitchensink/commit/568d792b4750a01f33e85661d0aa6e20260a7e96)

[Example of setting callbacks on controller](https://github.com/cone/r5kitchensink/commit/29ea81072f30782c072b5805ca348080621b6601)

[Example of using prepend_before_action](https://github.com/cone/r5kitchensink/commit/eac26a5d41230cc18b00178c6b84a8c0a11b150c)

[Example of around_action](https://github.com/cone/r5kitchensink/commit/a3f78bc70eead83ae4a7e67076805236c74b0644)

[Example of skipping cllbacks](https://github.com/cone/r5kitchensink/commit/1ebca414ea02e30516cfcfd4185e9416daeefa3a)


Models
----

[Example of ActiveRecord table configurations](https://github.com/cone/r5kitchensink/commit/ccbf28716b0bb9e8538434679c1220ea1960cdd8)

[Example of adding a default value for a field directly on the model](https://github.com/cone/r5kitchensink/commit/a67639a7317061881db3e3264ee8bef31ca147a2)

[Examples of model instance creation](https://github.com/cone/r5kitchensink/commit/4fbc0f9f70da6b090093b3655c8de135f8ddc736)

[Examples of finding records](https://github.com/cone/r5kitchensink/commit/768e745b6769979b9a27fc801a0d0bd31f818fc7)

[Examples of accessing model instance attributes](https://github.com/cone/r5kitchensink/commit/ba03329614d2f461c41aebc8cb4704d792869fc9)
