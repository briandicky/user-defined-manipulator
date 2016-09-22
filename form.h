#include <iostream>
#include <iomanip>
#include <sstream>

class Form;

struct Bound_form 
{
	const Form& f;
	double val;
};

class Form 
{
	private:
		int prc;
		int fmt;
	public:
		friend std::ostream& operator<<(std::ostream&, const Bound_form&);

		Bound_form operator()(double d) const {
			return Bound_form{*this, d};
		}

		Form(int p = 6): prc(p), fmt(0) {};
		
		~Form() {};

		Form& scientific() {
			fmt = std::ios_base::scientific;
			return *this;
		};

		Form& fixed() {
			fmt = std::ios_base::fixed;
			return *this;
		};

		Form & precision(int p) {
			prc = p;
			return *this;
		};
};

std::ostream& operator<<(std::ostream& os, const Bound_form& bf) 
{
	std::ostringstream s;

	s.precision(bf.f.prc);
	s.setf((std::ios_base::fmtflags)bf.f.fmt, std::ios_base::floatfield);
	s << bf.val;

	return os << s.str();
}
