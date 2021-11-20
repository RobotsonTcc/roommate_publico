// initialising variables.
const likeButton = document.getElementById("like");
const passButton = document.getElementById("pass");
const container = document.getElementById("container");

let running = false;

let profiles = [];


function loadProfiles(profile) {
	profiles.push(profile);
}

// when like button clicked activate the swipe like
likeButton.addEventListener(
	"click",
	function(e) {
		if (running == false) {
			const heart = document.getElementById("profile-heart");
			heart.style.opacity = 0.5;
			running = true;
			swipeLike();
		}
	},
	false
);

// when pass button clicked activate the swipe pass
passButton.addEventListener(
	"click",
	function(e) {
		if (running == false) {
			const pass = document.getElementById("profile-cross");
			pass.style.opacity = 0.5;
			running = true;
			swipePass();
		}
	},
	false
);

// sets the profile to a random user based on the 'looking for'
function setProfile() {
	const lforv = "Female"; //document.getElementById("lfor").value;
	//const r = Math.floor(Math.random() * profiles.length);
	const r = profiles.length;
	wording.innerHTML = `${profiles[r].name}  ${profiles[r].age} • ${profiles[r].location}&nbsp;&nbsp;&nbsp;<span style='color:blue;cursor:pointer'>View Profile</span>`;
	pic.innerHTML = profiles[r].pic;
}


// enables the profile to be draggable using GSAP Draggable.
function swipe() {
	Draggable.create("#profile", {
		throwProps: true,
		onDrag: checkPosition,
		onDragEnd: function(endX) {
			if (Math.round(this.endX) > 0) {
				swipeLike(); // like if drag the right
			} else {
				swipePass(); // pass if drag to the left
			}
		}
	});
}

// checks drag position and hides/shows heart or cross depending
function checkPosition() {
	const heart = document.getElementById("profile-heart");
	const cross = document.getElementById("profile-cross");
	const qmark = document.getElementById("qmark");

	if (this.x > 0) {
		cross.style.opacity = 0;
		heart.style.opacity = 0.5;
		qmark.style.opacity = 0.5;
		heart.style.animationPlayState = "running";
	}
	if (this.x < 0) {
		heart.style.opacity = 0;
		cross.style.opacity = 0.5;
		qmark.style.opacity = 0.5;
		cross.style.animationPlayState = "running";
	}
}

// profile is liked so we move it and rotate it, then on complete it is removed from the HTML so it vanishes.
function swipeLike() {
	const profile = document.getElementById("profile");
	let tl = new gsap.timeline({
		repeat: 0,
		yoyo: false,
		repeatDelay: 0,
		onComplete: remove,
		onCompleteParams: [profile]
	}
	);

	tl.to("#profile", 0.8, {
		x: "+=400",
		y: "+=350",
		rotation: "60",
		ease: Power1.easeInOut
	});
	
			alert("like")

}

// profile is passed so we move it and rotate it, then on complete it is removed from the HTML so it vanishes.
function swipePass() {
	const profile = document.getElementById("profile");
	let tl = new gsap.timeline({
		repeat: 0,
		yoyo: false,
		repeatDelay: 0,
		onComplete: remove,
		onCompleteParams: [profile]
	});

	tl.to("#profile", 0.8, {
		x: "-=400",
		y: "+=350",
		rotation: -60
	});

}

// after liking or passing this removes the profile from the HTML so it vanishes. Immediately after it is added back in to start again.
function remove(element) {
	element.parentNode.removeChild(element);
	running = false;
	addProfile();
}

// on changing the 'looking for' remove the existing profile and add a new one.
function updateLookingfor() {
	const profile = document.getElementById("profile");
	remove(profile);
}

// add a new random profile to the HTML that matches the selected 'looking for'
function addProfile() {
	const lforv = "Female"; //document.getElementById("lfor").value;
	const r = Math.floor(Math.random() * profiles.length);
	const wording = document.getElementById("wording");

	// the tricky bit of inserting the profile into the HTML..in JQUERY this is done with 'prepend' but I do it with insertAdjacentHTML, basically it inserts the profile class directly at the start of the content class.
	content.insertAdjacentHTML(

		"afterbegin",
		"<div class='profile' id='profile'>" +
			"<div class='profile-photos'>" +
				"<div class='pic' id='pic'>"+
					"<div class='profile-cross' id='profile-cross'>X</div>" +
						profiles[r].pic +
					"<div class='profile-heart' id='profile-heart'>V</div>"+
				"</div>"+
			"</div>" +
			"<div class='profile-header'>"+
				"<div class='profile-wording' id='wording'>" +
					profiles[r].name +
					" " +
					profiles[r].age +
					" • " +
					profiles[r].location +
	
					"<br> <button onclick='alert('Hello\nHow are you?')'>Try it</button>" + 
					
				"</div>" + 
			"</div>" + 
		"</div>"	
		
		);

  
	const qmark = document.getElementById("qmark");
	qmark.style.opacity = 0;
	swipe(); // allow the inserted class to be draggable.

}