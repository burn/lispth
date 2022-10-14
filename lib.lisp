"asdas
 adaa"

(defun asdas ()
  "-->num; asdas" 1)

(defvar *help* nil)

(defun readme (file)
   (labels ((defp(x) (member (first x) '(defun defmacro defmethod)))
            (docp(x) (and (> (length x) 3) (stringp (fourth x)))))
  (reads file (lambda (x)
    (cond ((stringp x) 
           (mapc 'print (reverse *help*)) 
           (setf *help* nil)
           (format t "~%~%~a~%~%" x)))
    (cond ((and (defp x) (docp x))
           (destructuring-bind (retrn txt) (splits (third x) #\;)
                 (push (format t "|`(~(~a~) ~(~a~))` -> ~a | ~a |~%")))))))))
