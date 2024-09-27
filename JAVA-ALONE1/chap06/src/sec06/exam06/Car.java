package sec06.exam06;

public class Car {
	//필드
	private int speed;
	private boolean stop;
	
	//생성자
	
	
	//메소드
	public int getSpeed() {							// getter 메소드
	return speed;
	}

	public void setSpeed(int speed) {				// setter 메소드
		if(speed < 0) {
			this.speed = 0;
			return;
		} else {
			this.speed = speed;
		}
	}
	
	public boolean isStop() {						// getter 메소드
		return stop;
	}
	public void setStop(boolean stop) {				// setter 메소드
		this.stop = stop;
		this.speed = 0;
	}
}
