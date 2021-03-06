require 'rails_helper'

describe Post, type: :model do
	title = "Dear America: Here’s Your Gun Solution"
	message = "Here’s some common sense for you. I want gun ownership to be as boring and annoying as car ownership. I want you to go to some Department of Weapons and sit for hours. I want folks who own guns to prove their skill, their mental and physical health, and to be licensed and reviewed over the years just as happens with our driver’s licenses. You earn the right to own and drive a vehicle; earn the right to own and use a gun.
Quibble with me over semantics if you want to; what is a “right” vs. what is a “privilege.” I’ll be busy with my friends and colleagues trying to prevent more unnecessary deaths.
Gun ownership isn’t some inalienable right granted by God. Remember, the Constitution was written by men coming out of a long and bloody war near the end of the 18th century. It was written for their time.
It also included the “right” to own a human being.
Things change.
Folks evolve.
I want a voluntary federal buyback program for firearms, with hunting weapons and vintage/historic weapons exempt. I want the sale of weapons to be even more tightly controlled than the sale of Xanax and other controlled substances. I want advertising for firearms to be as regulated as DTC (direct to consumer) advertising for pharmaceuticals (“May cause shortness of breath, long-lasting boners, etc.”) We can do all of this. It’ll create jobs, believe it or not: regulators, educators, enforcers.
It will not end murder. It won’t end rape or robbery either. It WILL make it harder to commit those crimes. There will be a black market for guns as there is for any coveted item in a capitalist society. (And I’m not anti-capitalism, btw. I’m a big fan! Sorry, hippies. I do love you guys, by the way, you’re very nice people with good instincts.)
Continuing education credits for gun owners should be required, just as they are with medical professionals. When you have a greater ability to take a human life you have a greater responsibility to prove your fitness to wield the tools that may create that end.
And that’s how the fuck you well-regulate a goddamn American militia."

	it 'persists a new post' do
		post = Post.create(title: title, message: message)

		expect(post).to be_valid
		expect(post.title).to eq title
		expect(post.message).to eq message
	end

	it 'should require a title' do
		post = Post.new(title: nil, message: message)

		expect(post.save).to be false
		expect(post).to_not be_persisted
	end

	it 'should require a message' do
		post = Post.new(title: title, message: nil)

		expect(post.save).to be false
		expect(post).to_not be_persisted
	end
end
