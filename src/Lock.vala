/* 
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

namespace GICR {

	/**
	 * Represents a lock placed on an item.
	 */
	public interface Lock : Object {

		/**
		 * Returns the value of the jcr:lockOwner property. This is either the
		 * client supplied owner information (see LockManager::lock()),
		 * an implementation-dependent string identifying the user who either
		 * created the lock or who is bound to the session holding the lock, or
		 * null if none of these are available.
		 *
		 * The lock owner's identity is only provided for informational purposes.
		 * It does not govern who can perform an unlock or make changes to the
		 * locked nodes; that depends entirely upon who the token holder is.
		 *
		 * @return string a user ID
		 */
		public abstract string get_lock_owner();

		/**
		 * Returns true if this is a deep lock; false otherwise.
		 */
		public abstract bool is_deep();

		/**
		 * Returns the lock holding node.
		 *
		 * Note that n.getLock().getNode() (where n is a locked node) will only
		 * return n if n is the lock holder. If n is in the subgraph of the lock
		 * holder, h, then this call will return h.
		 *
		 * @return {@link Node}
		 */
		public abstract Node get_node();

		/**
		 * May return the lock token for this lock.
		 *
		 * If this lock is open-scoped and the current session either holds the lock token for this lock, or the
		 * repository chooses to expose the lock token to the current session,
		 * then this method will return that lock token. Otherwise this method will
		 * return null.
		 *
		 * @return a string which represents lock token
		 */
		public abstract string get_lock_token();

		/**
		 * Returns the number of seconds remaining until this locks times out.
		 *
		 * If the lock has already timed out, a negative value is returned. If the
		 * number of seconds remaining is infinite or unknown, G_MAXLONG is
		 * returned.
		 *
		 * @return integer the number of seconds remaining until this lock times out.
		 *
		 * @throws RepositoryException if the timeout is infinite or unknown
		 */
		public abstract long get_seconds_remaining();

		/**
		 * Determines if the lock is still in effect.
		 *
		 * Returns true if this Lock object represents a lock that is currently in
		 * effect. If this lock has been unlocked either explicitly or due to an
		 * implementation-specific limitation (like a timeout) then it returns false.
		 * Note that this method is intended for those cases where one is holding a
		 * Lock Java object and wants to find out whether the lock (the JCR-level
		 * entity that is attached to the lockable node) that this object originally
		 * represented still exists. For example, a timeout or explicit unlock will
		 * remove a lock from a node but the Lock Java object corresponding to that
		 * lock may still exist, and in that case its isLive method will return false.
		 *
		 * @return True, if the lock still counts, else false.
		 *
		 * @throws RepositoryException if an error occurs
		 */
		public abstract bool is_live();

		/**
		 * Determines if this lock is session-scoped.
		 *
		 * Returns true if this is a session-scoped lock and the scope is bound to the
		 * current session. Returns false otherwise.
		 *
		 * @return True, if the lock current session is locked, else false.
		 */
		public abstract bool is_session_scoped();

		/**
		 * Determines if the current session owns this lock.
		 *
		 * Returns true if the current session is the owner of this lock, either because
		 * it is session-scoped and bound to this session or open-scoped and this session
		 * currently holds the token for this lock. Returns false otherwise.
		 *
		 * @return True, if the the current session is the owner of the lock, else false.
		 */
		public abstract bool is_lock_owning_session();

		/**
		 * If this lock's time-to-live is governed by a timer, this method resets that
		 * timer so that the lock does not timeout and expire.
		 *
		 * If this lock's time-to-live is not governed by a timer, then this method has no effect.
		 *
		 * @throws LockException if this Session does not hold the correct lock token for this lock.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract void refresh();

	}
}
